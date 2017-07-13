//
//  BaseNavigationController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationBar.setBackgroundImage(UIImage.colorImage(color: .theme), for: .default)
        self.navigationBar.shadowImage = UIImage.colorImage(color: .clear)
        
    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let button = UIButton(type: .custom)
            button.setImage(UIImage.init(named: "back_white"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
            button.addTarget(self, action: #selector(BaseNavigationController.pop), for: .touchUpInside)
            button.sizeToFit()
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            self.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func pop() -> Void {
        self.popViewController(animated: true)
    }
    
}
