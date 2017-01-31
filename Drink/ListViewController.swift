//
//  ListViewController.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
//        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "Cell")
        //tableView.rowHeight = UITableViewAutomaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! PostTableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
