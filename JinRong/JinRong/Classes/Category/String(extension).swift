//
//  String(extension).swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/25.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import Foundation

extension String{
    
    public var isPhone: Bool {
        
        if (characters.count < 11){
            return false;
        }else{
//            /// 移动号段
//            let CM_NUM = "^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$"
//            /// 联通号段
//            let CU_NUM = "^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$"
//            /// 电信号段
//            let CT_NUM = "^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$"
            let NUM = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
            
//            let pred1 = NSPredicate(format: "SELF MATCHES %@", CM_NUM)
//            let pred2 = NSPredicate(format: "SELF MATCHES %@", CU_NUM)
//            let pred3 = NSPredicate(format: "SELF MATCHES %@", CT_NUM)
            let pred = NSPredicate(format: "SELF MATCHES %@", NUM)
            
//            let isMatch1 = pred1.evaluate(with: self)
//            let isMatch2 = pred2.evaluate(with: self)
//            let isMatch3 = pred3.evaluate(with: self)
            let isMatch = pred.evaluate(with: self)
            
            if isMatch {
                return true
            }else{
                return false
            }
        }
        
    }
    
}
