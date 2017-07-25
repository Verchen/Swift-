//
//  RegistVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class RegistVC: BaseController, UIScrollViewDelegate {

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "注册"
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegistVC.keyboardChange), name: .UIKeyboardWillChangeFrame, object: nil)

    }
    
    func setupUI() -> Void {
        view.addSubview(scrollView)
        scrollView.addSubview(logo)
        scrollView.addSubview(phoneField)
        scrollView.addSubview(line1)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(line2)
        scrollView.addSubview(smsField)
        smsField.rightView = smsButton
        scrollView.addSubview(registButton)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.width.equalTo(200)
            make.height.equalTo(200 * 0.618)
            make.centerX.equalTo(scrollView)
        }
        phoneField.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom).offset(30)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(35)
        }
        line1.snp.makeConstraints { (make) in
            make.top.equalTo(phoneField.snp.bottom).offset(5)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(0.5)
        }
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(5)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(35)
        }
        line2.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(5)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(0.5)
        }
        smsField.snp.makeConstraints { (make) in
            make.top.equalTo(line2.snp.bottom).offset(5)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(35)
        }
        registButton.snp.makeConstraints { (make) in
            make.top.equalTo(smsField.snp.bottom).offset(30)
            make.left.equalTo(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(45)
        }
    }
    
    
    func smsClick() -> Void {
        smsButton.start()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func registClick() -> Void {
        guard phoneField.hasText && passwordField.hasText && smsField.hasText else {
            HUD.flash(.error, delay: 1)
            return
        }
        
        registButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.registButton.isEnabled = true
        }
        
        let param:Parameters = [
            "tel":phoneField.text!,
            "pass":passwordField.text!
        ]
        
        Alamofire.request(URL_Register, method: .post, parameters: param).responseJSON { (response) in
            print(response.value ?? "没数据")
        }

    }
    
    func keyboardChange(notifi: Notification) {
        let notiInfo = notifi.userInfo
        let rect = (notiInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let changeValue = smsField.frame.maxY + 64 - rect.origin.y
        
        if changeValue > 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: changeValue + 10), animated: true)
        }else{
            scrollView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    
    //MARK: - 懒加载
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.delegate = self
        return scroll
    }()
    
    lazy var logo: UIImageView = {
        let lg = UIImageView()
        lg.image = #imageLiteral(resourceName: "placeholder.png")
        return lg
    }()
    
    lazy var phoneField: UITextField = {
        let phone = UITextField()
        phone.placeholder = "请输入手机号"
        phone.keyboardType = .phonePad
        return phone
    }()
    
    lazy var line1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(valueRGB: 0xcdcdcd)
        return line
    }()
    
    lazy var passwordField: UITextField = {
        let pwd = UITextField()
        pwd.placeholder = "请输入密码"
        return pwd
    }()
    
    lazy var line2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(valueRGB: 0xcdcdcd)
        return line
    }()
    
    lazy var smsField: UITextField = {
        let sms = UITextField()
        sms.placeholder = "请输入验证码"
        sms.rightViewMode = .always
        return sms
    }()
    
    lazy var smsButton: SMSButton = {
        let sms = SMSButton(frame: CGRect(x: 0, y: 0, width: 80, height: 35))
        sms.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sms.addTarget(self, action: #selector(RegistVC.smsClick), for: .touchUpInside)
        sms.backgroundColor = UIColor.theme
        return sms
    }()
    
    lazy var registButton: UIButton = {
        let regist = UIButton(type: .custom)
        regist.backgroundColor = UIColor.theme
        regist.setTitle("注册", for: .normal)
        regist.layer.cornerRadius = 5
        regist.addTarget(self, action: #selector(RegistVC.registClick), for: .touchUpInside)
        return regist
    }()

}
