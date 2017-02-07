//
//  ListViewController.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView!
    
    let realm = try! Realm()
    let storeArray = try! Realm().objects(Store.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableViewAutomaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! PostTableViewCell
        cell.setupdata(store: storeArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController: ShowViewController = self.storyboard?.instantiateViewController(withIdentifier: "Show") as! ShowViewController
        
        // 配列からタップされたインデックスのデータを取り出す
        let touchData = storeArray[indexPath.row]
        nextViewController.touch =  touchData

        self.navigationController?.pushViewController(nextViewController, animated: true)

        self.tableView.reloadData()

    }
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // データベースから削除する  // ←以降追加する
            try! realm.write {
                self.realm.delete(self.storeArray[indexPath.row])
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
            }
        }
    }

}
