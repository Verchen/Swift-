//
//  ContactsModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/25.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import ObjectMapper

class ContactsModel: Mappable {
    
    var addTime : String?
    var id : Int?
    var name : String?
    var relationId : Int?
    var tel : String?
    var userId : Int?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map)
    {
        addTime <- map["add_time"]
        id <- map["id"]
        name <- map["name"]
        relationId <- map["relation_id"]
        tel <- map["tel"]
        userId <- map["user_id"]
        
    }

}
