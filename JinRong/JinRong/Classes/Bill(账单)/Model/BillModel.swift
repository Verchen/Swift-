//
//  BillModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/26.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import ObjectMapper

class BillModel: Mappable {
    
    var notYetList : [AnyObject]?
    var notYetMoney : Int?
    var yetMoney : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map)
    {
        notYetList <- map["notYetList"]
        notYetMoney <- map["notYetMoney"]
        yetMoney <- map["yetMoney"]
        
    }

}
