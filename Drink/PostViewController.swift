//
//  PostViewController.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController {
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
    
    var store = Store()
    let realm = try! Realm()
    //let storeArray = try! Realm().objects(Store.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @IBAction func camera(_ sender: Any) {
    }
}
