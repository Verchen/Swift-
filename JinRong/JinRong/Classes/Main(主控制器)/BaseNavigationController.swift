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
    
        navigationBar.setBackgroundImage(UIImage.colorImage(color: .theme), for: .default)
        navigationBar.shadowImage = UIImage.colorImage(color: .clear)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 20)]
    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let item = UIBarButtonItem(image: #imageLiteral(resourceName: "back_white").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(BaseNavigationController.pop))
            
            viewController.navigationItem.leftBarButtonItem = item
            self.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func pop() -> Void {
        self.popViewController(animated: true)
    }
    
}
