//
//	Data.swift
//
//	Create by 伟成 乔 on 25/7/2017
//	Copyright © 2017 伟成 乔. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation
import ObjectMapper

class BorrowDetailModel : Mappable{

	var back : String!
	var cardCode : String!
	var cardId : Int!
	var day : Int!
	var inAccountMoney : Int!
	var interest : Int!
	var repaymentAllMoney : Int!
	var repaymentTime : String!
	var serviceMoney : Int!

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        back              <- map["back"]
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
