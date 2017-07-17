//
//  JDAuthResultVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/17.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class JDAuthResultVC: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "认证结果"
        navigationItem.leftBarButtonItem?.customView?.isHidden = true
        
        setupUI()
        
    }
    
    func setupUI() -> Void {
        let width: CGFloat = UIScreen.main.bounds.width
        
        let image = UIImageView(frame: CGRect(x: (width - 200)/2, y: 30, width: 200, height: 200))
        image.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
        view.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 0, y: image.frame.maxY + 20, width: width, height: 20))
        label.textAlignment = .center
        label.text = "认证成功！"
        view.addSubview(label)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 30, y: label.frame.maxY + 30, width: width - 60, height: 40)
        button.backgroundColor = UIColor.theme
        button.setTitle("确定", for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(JDAuthResultVC.pop), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    func pop() -> Void {
        navigationController?.popToRootViewController(animated: true)
    }
}
