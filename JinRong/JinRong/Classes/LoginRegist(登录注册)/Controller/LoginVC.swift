//
//  LoginVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class LoginVC: BaseController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        view.addSubview(scrollView)
        scrollView.addSubview(logo)
        scrollView.addSubview(phoneNum)
        scrollView.addSubview(line1)
        scrollView.addSubview(password)
        scrollView.addSubview(line2)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(regist)
        scrollView.addSubview(forget)
        scrollView.addSubview(adImage)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.width.equalTo(200)
            make.height.equalTo(200 * 0.618)
            make.centerX.equalTo(scrollView)
        }
        phoneNum.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(logo.snp.bottom).offset(30)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(35)
            make.centerX.equalTo(scrollView)
        }
        line1.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(phoneNum.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(0.5)
            make.centerX.equalTo(scrollView)
        }
        password.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(line1.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(phoneNum)
            make.centerX.equalTo(scrollView)
        }
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(password.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(0.5)
            make.centerX.equalTo(scrollView)
        }
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(line2.snp.bottom).offset(20)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(45)
            make.centerX.equalTo(scrollView)
        }
        
        regist.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        forget.snp.makeConstraints { (make) in

            make.right.equalTo(view).offset(-20)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        adImage.snp.makeConstraints { (make) in
            make.top.equalTo(regist.snp.bottom).offset(20)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(200)
            make.bottom.equalTo(-30)
            make.centerX.equalTo(scrollView)
        }
        
    }
    
    //MARK: - scrollview代理方法
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    //MARK: - 事件方法
    func loginClick() -> Void {
        navigationController?.popViewController(animated: true)
    }
    func registClick() -> Void {
        navigationController?.pushViewController(BaseController(), animated: true)
    }
    func forgetClick() -> Void {
        navigationController?.pushViewController(BaseController(), animated: true)
    }
    
    //MARK: - 懒加载
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.delegate = self
        return scroll
    }()
    
    lazy var logo: UIImageView = {
        let log = UIImageView()
        log.image = #imageLiteral(resourceName: "placeholder.png")
        return log
    }()
    
    lazy var phoneNum: UITextField = {
        let phone = UITextField()
        phone.placeholder = "请输入手机号"
        return phone
    }()
    
    lazy var line1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(valueRGB: 0xcdcdcd)
        return line
    }()
    
    lazy var password: UITextField = {
        let pwd = UITextField()
        pwd.placeholder = "请输入密码"
        pwd.isSecureTextEntry = true
        return pwd
    }()
    
    lazy var line2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(valueRGB: 0xcdcdcd)
        return line
    }()
    
    lazy var loginButton: UIButton = {
        let login = UIButton(type: .custom)
        login.backgroundColor = UIColor.theme
        login.setTitle("登录", for: .normal)
        login.layer.cornerRadius = 5
        login.addTarget(self, action: #selector(LoginVC.loginClick), for: .touchUpInside)
        return login
    }()
    
    lazy var regist: UIButton = {
        let reg = UIButton(type: .custom)
        reg.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        reg.setTitle("注册帐号", for: .normal)
        reg.setTitleColor(UIColor.black, for: .normal)
        reg.addTarget(self, action: #selector(LoginVC.registClick), for: .touchUpInside)
        return reg
    }()
    
    lazy var forget: UIButton = {
        let forg = UIButton(type: .custom)
        forg.setTitle("忘记密码?", for: .normal)
        forg.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forg.setTitleColor(UIColor.black, for: .normal)
        forg.addTarget(self, action: #selector(LoginVC.forgetClick), for: .touchUpInside)
        return forg
    }()
    
    lazy var adImage: UIImageView = {
        let ad = UIImageView()
        ad.image = #imageLiteral(resourceName: "placeholder.png")
        return ad
    }()

}
