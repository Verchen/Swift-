//
//  UpdatePasswordVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/26.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import PKHUD

class UpdatePasswordVC: BaseController {
    
    var phoneField = UITextField()
    var oldField = UITextField()
    var newField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "修改密码"
        
        setupUI()

    }
    
    func setupUI() -> Void {
        let width = UIScreen.main.bounds.width
        
        phoneField.frame = CGRect(x: 10, y: 20, width: width - 20, height: 35)
        phoneField.text = UserAccount.sharedInstance.phone
        phoneField.isUserInteractionEnabled = false
        view.addSubview(phoneField)
        
        let line1 = UIView(frame: CGRect.init(x: 10, y: phoneField.frame.maxY, width: width - 20, height: 0.5))
        line1.backgroundColor = UIColor.lightGray
        view.addSubview(line1)
        
        oldField.frame = CGRect(x: 10, y: phoneField.frame.maxY + 5, width: width - 20, height: 35)
        oldField.placeholder = "请输入原密码"
        view.addSubview(oldField)
        
        let line2 = UIView(frame: CGRect.init(x: 10, y: oldField.frame.maxY, width: width - 20, height: 0.5))
        line2.backgroundColor = UIColor.lightGray
        view.addSubview(line2)
        
        newField.frame = CGRect(x: 10, y: oldField.frame.maxY + 5, width: width - 20, height: 35)
        newField.placeholder = "请输入新密码"
        view.addSubview(newField)
        
        let commit = UIButton(type: .custom)
        commit.setTitle("提交", for: .normal)
        commit.backgroundColor = UIColor.theme
        commit.layer.cornerRadius = 5
        commit.frame = CGRect(x: 10, y: newField.frame.maxY + 20, width: width - 20, height: 45)
        commit.addTarget(self, action: #selector(UpdatePasswordVC.commitClick), for: .touchUpInside)
        view.addSubview(commit)
        
    }
    
    func commitClick() -> Void {
        guard oldField.hasText && newField.hasText else {
            return
        }
        let param: Parameters = [
            "id":UserDefaults.standard.object(forKey: MemberIdKey) ?? "",
            "oldpass":oldField.text ?? "",
            "newpass":newField.text ?? "",
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_PwdUpdate, method: .post, parameters: param).responseJSON { (response) in
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
