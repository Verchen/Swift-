//
//  LoginVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class LoginVC: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() -> Void {
        view.addSubview(scrollView)
        scrollView.addSubview(logo)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
        }
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.width.equalTo(200)
            make.height.equalTo(200 * 0.618)
            make.centerX.equalTo(view)
        }
        
    }
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    lazy var logo: UIImageView = {
        let log = UIImageView()
        log.image = #imageLiteral(resourceName: "placeholder.png")
        return log
    }()

}
