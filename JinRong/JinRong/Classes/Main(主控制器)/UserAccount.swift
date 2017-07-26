//
//  UserAccount.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/26.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class UserAccount {
    
    var phone: String?
    
    static let sharedInstance = UserAccount()
    private init() {}
    
}
