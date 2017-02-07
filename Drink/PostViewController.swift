//
//  PostViewController.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,AdobeUXImageEditorViewControllerDelegate{
    
    @IBOutlet weak var shopnameTextField: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var openTextField: UITextField!
    @IBOutlet weak var closeTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    
    @IBOutlet weak var drinkLabel: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var swich: UISwitch!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var cameraButton: UIBarButtonItem!
    
    var store = Store()
    let realm = try! Realm()
    //let storeArray = try! Realm().objects(Store.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
                
        self.navigationItem.setRightBarButtonItems([doneButton, cameraButton], animated: true)
        
//        // 枠のカラー
//        reviewTextView.layer.borderColor = UIColor.lightGray.cgColor
//        // 枠の幅
//        reviewTextView.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func edit(_ sender: Any) {
        try! realm.write {
            self.store.shopname = self.shopnameTextField.text!
            self.store.review = self.reviewTextView.text
            self.store.open = self.openTextField.text!
            self.store.close = self.closeTextField.text!
            self.store.add = self.addressTextField.text!
            self.store.tel = self.telTextField.text!
            
            if let img = self.imageView1.image{
                let image = UIImagePNGRepresentation(imageView1.image!)
                self.store.mainimage = image as NSData?
            }
            if let img1 = self.imageView2.image{
                let image1 = UIImagePNGRepresentation(imageView2.image!)
                self.store.subimage1 = image1 as NSData?
            }
            if let img2 = self.imageView3.image{
                let image2 = UIImagePNGRepresentation(imageView3.image!)
                self.store.subimage2 = image2 as NSData?
            }
            
            if swich.isOn == true{
                self.store.alcohol = true
            }
            
            self.realm.add(self.store, update: true)

        }
        
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func camera(_ sender: Any) {
        // アラートを作成
        let alert = UIAlertController(
            title: "写真を選択",
            message: "ライブラリまたは写真を撮るから選択",
            preferredStyle: .actionSheet)
        
        // アラートにボタンをつける
        alert.addAction(UIAlertAction(title: "ライブラリ", style: .default, handler: { action in
            // ライブラリ（カメラロール）を指定してピッカーを開く
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(pickerController, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "写真を撮る", style: .default, handler: { action in
            // カメラを指定してピッカーを開く
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerControllerSourceType.camera
                self.present(pickerController, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel))
        
        // アラート表示
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // 写真を撮影/選択したときに呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // あとでAdobeUXImageEditorを起動する
            // AdobeUXImageEditorで、受け取ったimageを加工できる
            // ここでpresentViewControllerを呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                // AdobeImageEditorを起動する
                let adobeViewController = AdobeUXImageEditorViewController(image: image)
                adobeViewController.delegate = self
                self.present(adobeViewController, animated: true, completion:  nil)
            }
            
        }
        
        // 閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    // AdobeImageEditorで加工が終わったときに呼ばれるメソッド
    func photoEditor(_ editor: AdobeUXImageEditorViewController, finishedWith image: UIImage?) {
        // 画像加工画面を閉じる
        editor.dismiss(animated: true, completion: nil)
        
        if let img2 = imageView2.image {
            imageView3.image = image
        }else if let img1 = imageView1.image {
            imageView2.image = image
        }else {
            imageView1.image = image
        }
        
    }
    
    // AdobeImageEditorで加工をキャンセルしたときに呼ばれる
    func photoEditorCanceled(_ editor: AdobeUXImageEditorViewController) {
        // 加工画面を閉じる
        editor.dismiss(animated: true, completion: nil)
    }
}
