//
//  RelationModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/8/9.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import ObjectMapper

class RelationModel: Mappable {
    
    var id : Int?
    var name : String?
    var sort : Int?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        sort <- map["sort"]
        
    }


}
