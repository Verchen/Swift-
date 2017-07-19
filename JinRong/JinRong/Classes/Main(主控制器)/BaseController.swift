//
//  BaseController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseController: UIViewController, NVActivityIndicatorViewable {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.hidesBackButton = true

    }

}
