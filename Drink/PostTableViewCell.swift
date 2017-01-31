//
//  PostTableViewCell.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/01/31.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var shopnameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
