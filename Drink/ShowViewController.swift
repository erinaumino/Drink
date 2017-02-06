//
//  ShowViewController.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import RealmSwift

class ShowViewController: UIViewController {
    
    @IBOutlet weak var shopnameLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    @IBOutlet weak var mainimageView: UIImageView!
    @IBOutlet weak var subimageView1: UIImageView!
    @IBOutlet weak var subimageView2: UIImageView!
    
    
    let realm = try! Realm()
    let storeArray = try! Realm().objects(Store.self)
    
    var touch:Store? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shopnameLabel.text = touch?.shopname
        self.openLabel.text = touch?.open
        self.closeLabel.text = touch?.close
        self.reviewTextView.text = touch?.review
        self.addressLabel.text = touch?.add
        self.tellLabel.text = touch?.tel
        
        if let image = touch?.mainimage{
            let img = UIImage(data: touch?.mainimage as! Data)
            self.mainimageView.image = img
        }
        if let image1 = touch?.subimage1{
            let img1 = UIImage(data: touch?.subimage1 as! Data)
            self.subimageView1.image = img1
        }
        if let image2 = touch?.subimage2{
            let img2 = UIImage(data: touch?.subimage2 as! Data)
            self.subimageView1.image = img2
        }
        
        if touch?.alcohol == true{
            
        }
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
