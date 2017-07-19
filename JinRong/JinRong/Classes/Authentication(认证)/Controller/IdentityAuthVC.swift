//
//  IdentityAuthVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class IdentityAuthVC: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "身份认证"

        setupUI()
        setupLayout()
    }
    
    func setupUI() -> Void {
        view.addSubview(upImage)
        view.addSubview(downImage)
        view.addSubview(handImage)
        view.addSubview(name)
        view.addSubview(carNum)
        view.addSubview(commit)
    }

    func setupLayout() -> Void {
        upImage.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.right.equalTo(downImage.snp.left).offset(-20)
            make.height.equalTo(90)
        }
        downImage.snp.makeConstraints { (make) in
            make.left.equalTo(upImage.snp.right).offset(20)
            make.top.equalTo(20)
            make.right.equalTo(-20)
            make.width.equalTo(upImage)
            make.height.equalTo(upImage)
        }
        handImage.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(upImage.snp.bottom).offset(10)
            make.right.equalTo(-20)
            make.height.equalTo(150)
        }
        name.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(handImage.snp.bottom).offset(10)
            make.right.equalTo(-20)
            make.height.equalTo(35)
        }
        carNum.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(name.snp.bottom).offset(10)
            make.right.equalTo(-20)
            make.height.equalTo(35)
        }
        commit.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(carNum.snp.bottom).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(35)
        }
    }
    
    //MARK: - 事件方法
    func commitClick() -> Void {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - 懒加载
    lazy var upImage: UIImageView = {
        let up = UIImageView()
        up.image = #imageLiteral(resourceName: "placeholder.png")
        return up
    }()
    
    lazy var downImage: UIImageView = {
        let down = UIImageView()
        down.image = #imageLiteral(resourceName: "placeholder.png")
        return down
    }()
    
    lazy var handImage: UIImageView = {
        let hand = UIImageView()
        hand.image = #imageLiteral(resourceName: "placeholder.png")
        return hand
    }()
    
    lazy var name: UILabel = {
        let nam = UILabel()
        nam.backgroundColor = UIColor.init(valueRGB: 0xCCCCCC)
        nam.textColor = UIColor.init(valueRGB: 0x6B6B6B)
        nam.text = "张某某"
        nam.textAlignment = .center
        return nam
    }()
    
    lazy var carNum: UILabel = {
        let num = UILabel()
        num.backgroundColor = UIColor.init(valueRGB: 0xCCCCCC)
        num.textColor = UIColor.init(valueRGB: 0x6B6B6B)
        num.text = "621661*****9012"
        num.textAlignment = .center
        return num
    }()
    
    lazy var commit: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.theme
        btn.setTitle("提交认证", for: .normal)
        btn.addTarget(self, action: #selector(IdentityAuthVC.commitClick), for: .touchUpInside)
        return btn
    }()

}
