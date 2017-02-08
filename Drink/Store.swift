//
//  Store.swift
//  Drink
//
//  Created by 海野恵凜那 on 2017/02/06.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import Foundation
import RealmSwift

class Store: Object {
    // 管理用 ID。プライマリーキー
    dynamic var id = UUID().uuidString
    
    // 店名
    dynamic var shopname = ""
    
    // レビュー
    dynamic var review = ""
    
    // opne
    dynamic var open = ""
    
    // close
    dynamic var close = ""
    
    // 住所
    dynamic var add = ""
    
    // 電話番号
    dynamic var tel = ""
    
    // メイン画像
    dynamic var mainimage:Data? = nil
    
    // サブ画像1
    dynamic var subimage1:Data? = nil
    
    // サブ画像2
    dynamic var subimage2:Data? = nil
    
    //飲み放題
    dynamic var canDrinkEndless:Bool = false
    
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}

