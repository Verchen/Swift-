//
//  AddContactsVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import PKHUD
import Alamofire
import ObjectMapper

class AddContactsVC: BaseController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let nameField = UITextField()
    let phoneField = UITextField()
    let relaField = UITextField()
    let pickerView = UIPickerView()
    var pickerMinY: CGFloat = 35.0
    let relaArr = ["夫妻", "父亲", "母亲", "子女", "兄弟姐妹", "其它亲属"]
    var relationId: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "添加联系人"
        let rightItem = UIBarButtonItem(title: "提交", style: .done, target: self, action: #selector(AddContactsVC.commit))
        rightItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightItem
        
        setupUI()
    }
    
    func setupUI() -> Void {
        
        view.addSubview(nameField)
        view.addSubview(phoneField)
        view.addSubview(relaField)
        view.addSubview(pickerView)
        
        let nameTip = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 25))
        nameTip.textAlignment = .center
        nameTip.text = "姓名"
        nameField.leftView = nameTip
        nameField.leftViewMode = .always
        nameField.placeholder = "请输入联系人姓名"
        
        let phoneTip = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 25))
        phoneTip.textAlignment = .center
        phoneTip.text = "手机号"
        phoneField.keyboardType = .phonePad
        phoneField.leftView = phoneTip
        phoneField.leftViewMode = .always
        phoneField.placeholder = "请输入手机号"
        
        
        let relaTip = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 25))
        relaTip.textAlignment = .center
        relaTip.text = "关系"
        relaField.leftView = relaTip
        relaField.leftViewMode = .always
        relaField.delegate = self
        relaField.placeholder = "请选择与联系人关系"
        relaField.isUserInteractionEnabled = true
        
        pickerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(view.snp.bottom).offset(pickerMinY)
            make.height.equalTo(200)
        }
        pickerView.backgroundColor = UIColor(valueRGB: 0xcdcdcd)
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let toolBar = UIView()
        toolBar.backgroundColor = UIColor(valueRGB: 0xededed)
        let queding = UIButton(type: .custom)
        queding.setTitle("确定", for: .normal)
        queding.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        queding.layer.cornerRadius = 5
        queding.backgroundColor = UIColor.theme
        queding.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: 5, width: 50, height: 25)
        queding.addTarget(self, action: #selector(AddContactsVC.pickerSlect), for: .touchUpInside)
        toolBar.addSubview(queding)
        view.addSubview(toolBar)
        toolBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(pickerView.snp.top)
            make.height.equalTo(35)
        }
        
        nameField.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(25)
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.theme
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(nameField.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        phoneField.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(line.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(25)
        }
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.theme
        view.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(phoneField.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        relaField.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(line2.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(25)
        }
        
    }
    
    //MARK: - PICKERVIEW代理方法
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return relaArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    //MARK: - UITextField代理方法
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        showPicker(isHiden: false)
        return false
    }
    
    //MARK: - 自定义方法
    
    func showPicker(isHiden: Bool) -> Void {
        if isHiden {
            pickerMinY = 35.0
        }else{
            pickerMinY = -200.0
        }
        view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
    }
    
    func commit() -> Void {
        guard nameField.hasText && phoneField.hasText && relaField.hasText else {
            HUD.flash(.labeledError(title: "请填写信息", subtitle: nil), delay: 1)
            return
        }
        if phoneField.text?.isPhone == false {
            HUD.flash(.labeledError(title: "无效手机号", subtitle: nil), delay: 1)
            return
        }
        let param: Parameters = [
            "tel":phoneField.text!,
            "name":nameField.text!,
            "relation":relationId!,
            "userId":"1",
            "access_token":"86200d12c3886a5f25a05b959660754ffdb899e3",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_ContactsAdd, method: .post, parameters: param).responseJSON { (response) in
            print(response.value ?? "wu")
        }
        
    }
    
    func pickerSlect() -> Void {
        showPicker(isHiden: true)
        let index = pickerView.selectedRow(inComponent: 0)
        relaField.text = relaArr[index]
        relationId = index.description
    }
    
    //MARK: - 方法重写
    override func updateViewConstraints() {
        pickerView.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.snp.bottom).offset(pickerMinY)
        }
        super.updateViewConstraints()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        showPicker(isHiden: true)
    }

}
