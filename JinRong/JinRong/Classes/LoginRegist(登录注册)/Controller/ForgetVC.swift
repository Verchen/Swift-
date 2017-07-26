//
//  ForgetVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/26.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import PKHUD

class ForgetVC: BaseController {

    var phoneField = UITextField()
    var pwdField = UITextField()
    var repatField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "找回密码"
        
        setupUI()
        
    }
    
    func setupUI() -> Void {
        let width = UIScreen.main.bounds.width
        
        phoneField.frame = CGRect(x: 10, y: 20, width: width - 20, height: 35)
        phoneField.placeholder = "请输入手机号"
        phoneField.keyboardType = .phonePad
        view.addSubview(phoneField)
        
        let line1 = UIView(frame: CGRect.init(x: 10, y: phoneField.frame.maxY, width: width - 20, height: 0.5))
        line1.backgroundColor = UIColor.lightGray
        view.addSubview(line1)
        
        pwdField.frame = CGRect(x: 10, y: phoneField.frame.maxY + 5, width: width - 20, height: 35)
        pwdField.placeholder = "请输入新密码"
        view.addSubview(pwdField)
        
        let line2 = UIView(frame: CGRect.init(x: 10, y: pwdField.frame.maxY, width: width - 20, height: 0.5))
        line2.backgroundColor = UIColor.lightGray
        view.addSubview(line2)
        
        repatField.frame = CGRect(x: 10, y: pwdField.frame.maxY + 5, width: width - 20, height: 35)
        repatField.placeholder = "请再次输入密码"
        view.addSubview(repatField)
        
        let commit = UIButton(type: .custom)
        commit.setTitle("提交", for: .normal)
        commit.backgroundColor = UIColor.theme
        commit.layer.cornerRadius = 5
        commit.frame = CGRect(x: 10, y: repatField.frame.maxY + 20, width: width - 20, height: 45)
        commit.addTarget(self, action: #selector(UpdatePasswordVC.commitClick), for: .touchUpInside)
        view.addSubview(commit)
        
    }
    
    func commitClick() -> Void {
        guard phoneField.hasText && pwdField.hasText && repatField.hasText else {
            return
        }
        if phoneField.text?.isPhone == false {
            HUD.flash(.labeledError(title: "无效手机号", subtitle: nil), delay: 1)
            return
        }
        let param: Parameters = [
            "tel":phoneField.text ?? "",
            "newPass":pwdField.text ?? "",
            "confirmPass":repatField.text ?? "",
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_PwdForget, method: .post, parameters: param).responseJSON { (response) in
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            if jsonDic["code"] as? Int == 0 {
                HUD.flash(.labeledError(title: jsonDic["message"] as? String, subtitle: nil), delay: 1)
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
        
    }

}
