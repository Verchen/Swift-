//
//  MainController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildVC()

    }
    
    func setupChildVC() -> Void {
        let borrowVC = BorrowController()
        borrowVC.title = "借款"
        let nav1 = BaseNavigationController(rootViewController: borrowVC)
        self.addChildViewController(nav1)
        
        let authVC = AuthController()
        authVC.title = "认证"
        let nav2 = BaseNavigationController(rootViewController: authVC)
        self.addChildViewController(nav2)
        
        let billVC = BillController()
        billVC.title = "账单"
        let nav3 = BaseNavigationController(rootViewController: billVC);
        self.addChildViewController(nav3)
        
        let profileVC = ProfileController()
        profileVC.title = "我的"
        let nav4 = BaseNavigationController(rootViewController: profileVC)
        self.addChildViewController(nav4)
        
    }

}
