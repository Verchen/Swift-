//
//	RootClass.swift
//
//	Create by 伟成 乔 on 24/7/2017
//	Copyright © 2017 伟成 乔. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation
import ObjectMapper

class RootClass: Mappable {

	var author : String!
	var click : Int!
	var id : String!
	var img : [String]!
	var state : Int!
	var time : String!
	var title : String!
	var type : Int!
	var url : String!

    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        author <- map["author"]
        click <- map["click"]
        id <- map["id"]
        img <- map["img"]
        state <- map["state"]
        time <- map["time"]
        title <- map["title"]
        type <- map["type"]
        url <- map["url"]
    }

}
