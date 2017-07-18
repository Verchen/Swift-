//
//  PhoneAuthVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class PhoneAuthVC: BaseController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "手机实名"
        setupUI()

    }
    
    func setupUI() -> Void {
        view.addSubview(phoneField)
        
        let line = UIView()
        line.backgroundColor = UIColor.theme
        view.addSubview(line)
    
        view.addSubview(pwdField)
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.theme
        view.addSubview(line2)
        
        view.addSubview(agree)
        
        let rule = UITextView()
        rule.delegate = self
        rule.isEditable = false
        rule.isScrollEnabled = false
        rule.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let attriStr = NSMutableAttributedString(string: "我已阅读并同意《服务条款》", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 16)])
        attriStr.addAttributes([NSLinkAttributeName : "rule://", NSUnderlineColorAttributeName : UIColor.lightGray], range: NSRange(location: 7, length: 6))
        rule.attributedText = attriStr
        view.addSubview(rule)
        
        view.addSubview(commit)
        
        
        phoneField.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(phoneField.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        pwdField.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(line.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        line2.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(pwdField.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        agree.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(line2.snp.bottom).offset(10)
            make.height.width.equalTo(20)
        }
        rule.snp.makeConstraints { (make) in
            make.left.equalTo(agree.snp.right).offset(5)
            make.right.equalTo(-10)
            make.height.centerY.equalTo(agree)
        }
        commit.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(agree.snp.bottom).offset(20)
            make.right.equalTo(-10)
            make.height.equalTo(35)
        }
    }
    
    //MARK: - textview代理方法
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        navigationController?.pushViewController(BaseController(), animated: true)
        return true
    }
    
    //MARK: - 事件方法
    func commitClick() -> Void {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - 懒加载
    lazy var phoneField: UITextField = {
        let phone = UITextField()
        let tip = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        tip.text = "手机号"
        tip.textAlignment = .center
        phone.isEnabled = false
        phone.leftView = tip
        phone.leftViewMode = .always
        phone.text = "13261301876"
        phone.textColor = UIColor.lightGray
        return phone
    }()
    
    lazy var pwdField: UITextField = {
        let pwd = UITextField()
        let tip = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        tip.text = "服务密码"
        tip.textAlignment = .center
        pwd.placeholder = "手机运营商服务密码"
        pwd.leftView = tip
        pwd.leftViewMode = .always
        return pwd
    }()
    
    lazy var agree: UIButton = {
        let btn = UIButton(type: .custom)
        btn.isSelected = true
        btn.setImage(#imageLiteral(resourceName: "agree_normal.png"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "agree_select.png"), for: .selected)
        return btn
    }()
    
    lazy var commit: UIButton = {
        let cmt = UIButton(type: .custom)
        cmt.setTitle("提交", for: .normal)
        cmt.backgroundColor = UIColor.theme
        cmt.layer.cornerRadius = 5
        cmt.addTarget(self, action: #selector(PhoneAuthVC.commitClick), for: .touchUpInside)
        return cmt
    }()

}
