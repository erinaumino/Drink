//
//  PlaceHolderedTextView.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/02/08.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

//
//  PlaceHolderedTextView.swift
//  PlaceHolderedTextView
//
//  Created by はるふ on 2016/11/29.
//  Copyright © 2016年 はるふ. All rights reserved.
//

import UIKit

@IBDesignable class PlaceHolderedTextView: UITextView {
    @IBInspectable var placeHolder: String = ""
    @IBInspectable var placeHolderColor: UIColor = .lightGray
    
    private var placeHolderLayer: CATextLayer?
    
    private func createPlaceHolderLayerIfNeed() {
        if placeHolderLayer == nil {
            let layer = CATextLayer()
            layer.fontSize = self.font?.pointSize ?? UIFont.systemFontSize
            layer.frame = CGRect(x: self.textContainerInset.left + self.textContainer.lineFragmentPadding, y: self.textContainerInset.top, width: self.frame.width, height: layer.fontSize+10)
            layer.string = self.placeHolder
            layer.foregroundColor = placeHolderColor.cgColor
            layer.contentsScale = UIScreen.main.scale
            layer.alignmentMode = kCAAlignmentLeft
            self.layer.addSublayer(layer)
            placeHolderLayer = layer
        }
    }
    
    private func removePlaceHolderLayerIfNeed() {
        placeHolderLayer?.removeFromSuperlayer()
        placeHolderLayer = nil
    }
    
    private func updateLayer() {
        // Observerから呼ばれるとmainじゃないかも？
        DispatchQueue.main.async {
            if (self.text == nil || self.text.isEmpty) && !self.isFirstResponder {
                self.createPlaceHolderLayerIfNeed()
            } else {
                self.removePlaceHolderLayerIfNeed()
            }
        }
    }
    
    func onChangedText(_ notification: NSNotification?) {
        updateLayer()
    }
    
    // MARK: Observer関連
    
    private func addObserver() {
        updateLayer()
        NotificationCenter.default.addObserver(self, selector: #selector(self.onChangedText(_:)), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addObserver()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        addObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
