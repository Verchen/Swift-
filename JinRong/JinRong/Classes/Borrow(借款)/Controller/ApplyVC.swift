//
//  ApplyVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/16.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class ApplyVC: BaseController {

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "申请成功"
        navigationItem.leftBarButtonItem = nil
        
        setupUI()
    }
    
    func setupUI() -> Void {
        
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        let image = UIImageView(image: #imageLiteral(resourceName: "placeholder.png"))
        scrollView.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.width.height.equalTo(200)
            make.centerX.equalTo(scrollView)
        }
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "您的借款已提交申请\n系统会在1-2小时内审核完成"
        scrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.width.equalTo(view.frame.width - 100)
            make.height.equalTo(50)
            make.centerX.equalTo(scrollView)
        }
        
        let button = UIButton(type: .custom)
        button.setTitle("查看申请进度", for: .normal)
        button.backgroundColor = UIColor.theme
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(ApplyVC.queryProgress), for: .touchUpInside)
        scrollView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(45)
            make.centerX.equalTo(scrollView)
            make.bottom.equalTo(-30)
        }
    }
    
    func queryProgress() -> Void {
        navigationController?.popToRootViewController(animated: true)
    }

}
