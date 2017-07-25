//
//  BorrowModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/24.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import Foundation
import ObjectMapper

class BorrowModel: Mappable {
    var day : Int!
    var id : Int!
    var lv : Int!
    var money : String!
    var sort : String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        id <- map["id"]
        lv <- map["lv"]
        money <- map["money"]
        sort <- map["sort"]
    }
    
}
