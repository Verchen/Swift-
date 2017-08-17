//
//  AuthController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Contacts
import PKHUD

let kLLOidPartner = "201408071000001543"
let kLLPartnerKey = "201408071000001543test_20140812"
let signType = "MD5"
let userId = "10001"
let cardNumber = "6216616009000541907"
let acctName = "乔伟成"
let idNumber = "370911199209254419"


class AuthController: BaseController, UITableViewDelegate, UITableViewDataSource, BasicCellDelegate, LLPaySdkDelegate {
    
    lazy var tableView: UITableView = {
        var table = UITableView(frame: CGRect.zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    var order: LLOrder?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        layoutSubviews()
        
        LLPayConfig();
    }
    
    
    //MARK: - tableview代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoCell") as? BasicInfoCell
            if cell == nil {
                cell = BasicInfoCell(style: .default, reuseIdentifier: "BasicInfoCell")
                cell?.delegate = self
            }
            return cell!
            
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            switch indexPath.row {
            case 0:
                cell?.imageView?.image = #imageLiteral(resourceName: "zhima.png")
                cell?.textLabel?.text = "芝麻信用分"
                break
            case 1:
                cell?.imageView?.image = #imageLiteral(resourceName: "zd_icon.png")
                cell?.textLabel?.text = "信用卡账单"
                break
            case 2:
                cell?.imageView?.image = #imageLiteral(resourceName: "tong.png")
                cell?.textLabel?.text = "手机通讯录"
                break
            default:
                cell?.imageView?.image = #imageLiteral(resourceName: "jd.png")
                cell?.textLabel?.text = "京东白条"
                break
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
//            navigationController?.pushViewController(UIViewController(), animated: true)
            pay()
        case 1:
            navigationController?.pushViewController(EmailAuthVC(), animated: true)
        case 2:
            queryABAuth()
        case 3:
            navigationController?.pushViewController(JDAuthVC(), animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            leftImage.image = #imageLiteral(resourceName: "bixuan.png")
            header.addSubview(leftImage)
            let title = UILabel(frame: CGRect(x: 40, y: 0, width: 200, height: 40))
            title.text = "基本信息(必填)"
            header.addSubview(title)
            return header
        default:
            let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            leftImage.image = #imageLiteral(resourceName: "kexuan.png")
            header.addSubview(leftImage)
            let title = UILabel(frame: CGRect(x: 40, y: 0, width: 200, height: 40))
            title.text = "其它信息(选填)"
            header.addSubview(title)
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return tableView.bounds.width / 4.0
        default:
            return 44
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    //MARK: - 自定义代理方法
    func basicCell(_ cell: BasicInfoCell, didSelect type: BasicInfoType) {
        switch type {
        case .contacts:
            navigationController?.pushViewController(ContactsVC(), animated: true)
        case .bankCar:
            navigationController?.pushViewController(BankCardVC(), animated: true)
        case .phoneAuth:
            navigationController?.pushViewController(PhoneAuthVC(), animated: true)
        case .identityAuth:
            navigationController?.pushViewController(IdentityAuthVC(), animated: true)
        }
    }
    
    /// 连连支付代理回调
    func paymentEnd(_ resultCode: LLPayResult, withResultDic dic: [AnyHashable : Any]!) {
        var msg = "异常"
        switch resultCode {
        case kLLPayResultSuccess:
            msg = "支付成功"
        case kLLPayResultFail:
            msg = "支付失败"
        case kLLPayResultCancel:
            msg = "支付取消"
        case kLLPayResultInitError:
            msg = "sdk初始化异常"
        case kLLPayResultInitParamError:
            msg = "支付订单参数有误，无法进行初始化，未传必要信息"
        default:
            msg = (dic! as NSDictionary).object(forKey: "ret_msg") as! String
        }
        
        let alert = UIAlertController(title: "支付结果", message: msg.appending(LLPayUtil.jsonString(ofObj: dic)), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - 私有方法
    
    func layoutSubviews() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 49, 0))
        }
    }

    /// 连连支付配置
    func LLPayConfig() -> Void {
        order = LLOrder(llPayType: 1)
        guard let llorder = order else { return  }
        
        let timeStamp = LLOrder.timeStamp()
        llorder.oid_partner = kLLOidPartner
        llorder.sign_type = signType
        llorder.busi_partner = "101001"
        llorder.no_order = "LL"+(timeStamp ?? "")
        llorder.dt_order = timeStamp
        llorder.money_order = "0.01"
        llorder.notify_url = "https://yintong.com.cn"
        llorder.acct_name = acctName
        llorder.card_no = cardNumber
        llorder.id_no = idNumber
        llorder.risk_item = LLOrder.llJsonString(ofObj: ["user_info_dt_register" : "20131030122130"])
        llorder.user_id = userId
        llorder.name_goods = "商品名"

    }
    
    func pay() -> Void {
        guard let llorder = order else { return  }
        let orderDic = llorder.tradeInfoForPayment()
        let payUtil = LLPayUtil()
        
        //进行签名
        let signedOrder = payUtil.signedOrderDic(orderDic, andSignKey: kLLPartnerKey)
        
        LLPaySdk.shared().sdkDelegate = self
        LLPaySdk.shared().present(in: self, with: LLPayType.init(rawValue: 1)!, andTraderInfo: signedOrder)
        
        
    }
    
    /// 获取通讯录权限
    func queryABAuth() -> Void {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status {
        case .notDetermined:
            let store = CNContactStore()
            store.requestAccess(for: .contacts, completionHandler: { (result, nil) in
                if result {
                    self.queryContacts()
                }
            })
        case .denied:
            print("denied")
            let alert = UIAlertController(title: "获取通讯录", message: "请在“设置”中允许佳易贷访问通讯录", preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        case .restricted:
            print("restricted")
        case .authorized:
            queryContacts()
        }
    }
    
    /// 获取通讯录信息
    func queryContacts() -> Void {
        let store = CNContactStore()
        //获取所有的联系人
        let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey];
        let request = CNContactFetchRequest.init(keysToFetch: keys as [CNKeyDescriptor]);
        try?store.enumerateContacts(with: request, usingBlock: { (contact, iStop) in
            //姓
            let firstName = contact.familyName;
            //名
            let lastName = contact.givenName;
            let phoneArr = contact.phoneNumbers;
            for labelValue in phoneArr{
                let cnlabelV = labelValue as CNLabeledValue;
                let value = cnlabelV.value;
                let phoneValue = value.stringValue;
                print(firstName,lastName,phoneValue);
            }
        })
    }
}
