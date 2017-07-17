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
        navigationItem.leftBarButtonItem?.customView?.isHidden = true
        
        setupUI()
    }
    
    func setupUI() -> Void {
        let image = UIImageView(image: #imageLiteral(resourceName: "tabbar_home_highlighted"))
        image.frame = CGRect(x: (view.frame.width - 200)/2, y: 30, width: 200, height: 200)
        view.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 50, y: image.frame.maxY + 20, width: view.frame.width - 100, height: 50))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "您的借款已提交申请\n系统会在1-2小时内审核完成"
        view.addSubview(label)
        
        let button = UIButton(type: .custom)
        button.setTitle("查看申请进度", for: .normal)
        button.frame = CGRect(x: (view.frame.width - 250)/2, y: label.frame.maxY + 20, width: 250, height: 35)
        button.backgroundColor = UIColor.theme
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(ApplyVC.queryProgress), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    func queryProgress() -> Void {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}
