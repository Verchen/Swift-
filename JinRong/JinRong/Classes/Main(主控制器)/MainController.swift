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
        borrowVC.tabBarItem.image = UIImage(named: "tabbar_home_normal")
        borrowVC.tabBarItem.selectedImage = UIImage(named: "tabbar_home_select")?.withRenderingMode(.alwaysOriginal)
        borrowVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.theme], for: .selected)
        let nav1 = BaseNavigationController(rootViewController: borrowVC)
        self.addChildViewController(nav1)
        
        let authVC = AuthController()
        authVC.title = "认证"
        authVC.tabBarItem.image = UIImage(named: "tabbar_auth_normal")
        authVC.tabBarItem.selectedImage = UIImage(named: "tabbar_auth_select")?.withRenderingMode(.alwaysOriginal)
        authVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.theme], for: .selected)
        let nav2 = BaseNavigationController(rootViewController: authVC)
        self.addChildViewController(nav2)
        
        let billVC = BillController()
        billVC.title = "账单"
        billVC.tabBarItem.image = UIImage(named: "tabbar_zhangdan_normal")
        billVC.tabBarItem.selectedImage = UIImage(named: "tabbar_zhangdan_select")?.withRenderingMode(.alwaysOriginal)
        billVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.theme], for: .selected)
        let nav3 = BaseNavigationController(rootViewController: billVC)
        self.addChildViewController(nav3)
        
        let profileVC = ProfileController()
        profileVC.title = "我的"
        profileVC.tabBarItem.image = UIImage(named: "tabbar_wo_normal")
        profileVC.tabBarItem.selectedImage = UIImage(named: "tabbar_wo_select")?.withRenderingMode(.alwaysOriginal)
        profileVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.theme], for: .selected)
        let nav4 = BaseNavigationController(rootViewController: profileVC)
        self.addChildViewController(nav4)
        
    }

}
