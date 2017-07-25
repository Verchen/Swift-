//
//  ProgressModel.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/25.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import Foundation
import ObjectMapper

class ProgressModel: Mappable {
    
    var audit : Int!
    var day : Int!
    var inAccountMoney : Int!
    var interest : Int!
    var loanId : Int!
    var money : String!
    var serviceMoney : Int!

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        audit           <- map["audit"]
        day             <- map["day"]
        inAccountMoney  <- map["inAccountMoney"]
        interest        <- map["interest"]
        loanId          <- map["loanId"]
        money           <- map["money"]
        serviceMoney    <- map["serviceMoney"]
    }

}
