//
//  BorrowDetailModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/24.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import ObjectMapper

class BorrowDetailModel: Mappable {
    
    var back              : String!
    var cardCode          : Int!
    var cardId            : Int!
    var day               : Int!
    var inAccountMoney    : Int!
    var interest          : Int!
    var repaymentAllMoney : Int!
    var repaymentTime     : String!
    var serviceMoney      : Int!
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        back              <- map[""]
        cardCode          <- map["cardCode"]
        cardId            <- map["cardId"]
        day               <- map["day"]
        inAccountMoney    <- map["inAccountMoney"]
        interest          <- map["interest"]
        repaymentAllMoney <- map["repaymentAllMoney"]
        repaymentTime     <- map["repaymentTime"]
        serviceMoney      <- map["serviceMoney"]
    }
}
