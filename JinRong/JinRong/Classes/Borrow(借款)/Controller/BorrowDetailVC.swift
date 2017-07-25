//
//  BorrowDetailVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/15.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class BorrowDetailVC: BaseController {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect.zero)
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    var id : String?
    var dataSource : BorrowDetailModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "确认借款"
        
        requestDataSource()

    }
    
    func requestDataSource() {
        if id == nil {
            return
        }
        let param: Parameters = [
            "userId":"1"
        ]
        
//        Alamofire.request(URL_BorrowDetail+id!, method: .post, parameters: param).responseJSON { (response) in
//            print(response.value ?? "没有数据")
//            if let resDic = response.value as? [String : Any]{
//                self.dataSource = BorrowDetailModel(JSON: resDic["data"] as! [String : Any])
//                self.setupUI()
//            }
//            
//        }
        Alamofire.request(URL_BorrowDetail+id!, method: .post, parameters: param).responseString { (response) in
            print(response.value ?? "没有数据")
        }
    }
    
    func setupUI() -> Void {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }

        let width: CGFloat = UIScreen.main.bounds.width
        
        let container = DottedBoardView()
        scrollView.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.width.equalTo(width - 60)
            make.centerX.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(200)
        }
        
        let level = UILabel()
        level.text = "LV1"
        level.textColor = UIColor.theme
        container.addSubview(level)
        level.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        let itemWidth = (width - 80) / 3
        let daozhangTip = UILabel()
        daozhangTip.text = "到账金额"
        daozhangTip.textAlignment = .center
        daozhangTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(daozhangTip)
        daozhangTip.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(level.snp.bottom).offset(5)
            make.width.equalTo(itemWidth)
            make.height.equalTo(20)
        }
        
        let daoMoney = UILabel()
        daoMoney.text = dataSource?.inAccountMoney.description
        daoMoney.font = UIFont.systemFont(ofSize: 20)
        daoMoney.textColor = UIColor.init(valueRGB: 0x986515)
        daoMoney.textAlignment = .center
        container.addSubview(daoMoney)
        daoMoney.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(daozhangTip.snp.bottom).offset(5)
            make.width.equalTo(itemWidth)
            make.height.equalTo(25)
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.theme
        container.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(daozhangTip.snp.right)
            make.top.equalTo(level.snp.bottom)
            make.width.equalTo(1)
            make.height.equalTo(60)
        }
        
        let fuwuTip = UILabel()
        fuwuTip.text = "服务费"
        fuwuTip.textAlignment = .center
        fuwuTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(fuwuTip)
        fuwuTip.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right)
            make.top.equalTo(daozhangTip)
            make.width.equalTo(itemWidth)
            make.height.equalTo(20)
        }
        
        let fuwuMoney = UILabel()//(frame: CGRect(x: line.frame.maxX, y: daoMoney.frame.minY, width: itemWidth, height: 25))
        fuwuMoney.text = dataSource?.serviceMoney.description
        fuwuMoney.textColor = UIColor.init(valueRGB: 0x986515)
        fuwuMoney.textAlignment = .center
        fuwuMoney.font = UIFont.systemFont(ofSize: 20)
        container.addSubview(fuwuMoney)
        fuwuMoney.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right)
            make.top.equalTo(daoMoney)
            make.width.equalTo(itemWidth)
            make.height.equalTo(25)
        }
        
        let line2 = UIView()//(frame: CGRect(x: fuwuTip.frame.maxX, y: level.frame.maxY, width: 1, height: 60))
        line2.backgroundColor = UIColor.theme
        container.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(fuwuTip.snp.right)
            make.top.equalTo(level.snp.bottom)
            make.width.equalTo(1)
            make.height.equalTo(60)
        }
        
        let dayTip = UILabel()//(frame: CGRect(x: line2.frame.maxX, y: daozhangTip.frame.minY, width: itemWidth, height: 20))
        dayTip.text = "借款天数"
        dayTip.textAlignment = .center
        dayTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(dayTip)
        dayTip.snp.makeConstraints { (make) in
            make.left.equalTo(line2.snp.right)
            make.top.equalTo(daozhangTip)
            make.width.equalTo(itemWidth)
            make.height.equalTo(20)
        }
        
        let day = UILabel()//(frame: CGRect(x: line2.frame.maxX, y: daoMoney.frame.minY, width: itemWidth, height: 25))
        day.text = dataSource?.day.description ?? ""+"天"
        day.textColor = UIColor.init(valueRGB: 0x986515)
        day.textAlignment = .center
        day.font = UIFont.systemFont(ofSize: 20)
        container.addSubview(day)
        day.snp.makeConstraints { (make) in
            make.left.equalTo(line2.snp.right)
            make.top.equalTo(daoMoney)
            make.width.equalTo(itemWidth)
            make.height.equalTo(25)
        }
        
        let horiLine = DottedView()//(frame: CGRect(x: 10, y: daoMoney.frame.maxY + 15, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine)
        horiLine.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(daoMoney.snp.bottom).offset(15)
            make.width.equalTo(width - 80)
            make.height.equalTo(1)
        }
        
        let nameTip = UILabel()//(frame: CGRect(x: 10, y: horiLine.frame.maxY + 10, width: 100, height: 18))
        nameTip.text = "借款人"
        nameTip.font = UIFont.systemFont(ofSize: 15)
        nameTip.textColor = UIColor.lightGray
        container.addSubview(nameTip)
        nameTip.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(horiLine.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        
        let name = UILabel()//(frame: CGRect(x: 120, y: nameTip.frame.minY, width: container.frame.width - 130, height: 18))
        name.text = "张某某"
        name.font = UIFont.systemFont(ofSize: 15)
        name.textAlignment = .right
        container.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(nameTip)
            make.width.equalTo(200)
            make.height.equalTo(18)
        }
        
        let horiLine2 = DottedView()//(frame: CGRect(x: 10, y: nameTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine2)
        horiLine2.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(nameTip.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        let bankTip = UILabel()//(frame: CGRect(x: 10, y: horiLine2.frame.maxY + 10, width: 100, height: 18))
        bankTip.text = "所属银行"
        bankTip.font = UIFont.systemFont(ofSize: 15)
        bankTip.textColor = UIColor.lightGray
        container.addSubview(bankTip)
        bankTip.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(horiLine2.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        
        let bank = UILabel()//(frame: CGRect(x: 120, y: bankTip.frame.minY, width: container.frame.width - 130, height: 18))
        bank.text = dataSource?.back
        bank.font = UIFont.systemFont(ofSize: 15)
        bank.textAlignment = .right
        container.addSubview(bank)
        bank.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(bankTip)
            make.width.equalTo(200)
            make.height.equalTo(18)
        }

        let horiLine3 = DottedView()//(frame: CGRect(x: 10, y: bankTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine3)
        horiLine3.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(bankTip.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        let bankNumTip = UILabel()//(frame: CGRect(x: 10, y: horiLine3.frame.maxY + 10, width: 100, height: 18))
        bankNumTip.text = "入行卡号"
        bankNumTip.font = UIFont.systemFont(ofSize: 15)
        bankNumTip.textColor = UIColor.lightGray
        container.addSubview(bankNumTip)
        bankNumTip.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(horiLine3.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        
        let bankNum = UILabel()//(frame: CGRect(x: 120, y: bankNumTip.frame.minY, width: container.frame.width - 130, height: 18))
        bankNum.text = dataSource?.cardCode.description
        bankNum.font = UIFont.systemFont(ofSize: 15)
        bankNum.textAlignment = .right
        container.addSubview(bankNum)
        bankNum.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(bankNumTip)
            make.width.equalTo(200)
            make.height.equalTo(18)
        }
        
        let horiLine4 = DottedView()//(frame: CGRect(x: 10, y: bankNumTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine4)
        horiLine4.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(bankNumTip.snp.bottom).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        let huanKuanContai = UIView()//(frame: CGRect(x: 10, y: horiLine4.frame.maxY + 10, width: (container.frame.width - 30) / 2, height: 80))
        huanKuanContai.layer.borderColor = UIColor.theme.cgColor
        huanKuanContai.layer.borderWidth = 1
        huanKuanContai.layer.cornerRadius = 5
        container.addSubview(huanKuanContai)
        huanKuanContai.snp.makeConstraints { (make) in

            make.left.equalTo(10)
            make.top.equalTo(horiLine4.snp.bottom).offset(10)
            make.width.equalTo((width - 90)/2)
            make.height.equalTo(80)
            make.bottom.equalTo(-20)
        }
        
        let hkTip = UILabel()//(frame: CGRect(x: 0, y: 10, width: huanKuanContai.frame.width, height: 20))
        hkTip.text = "还款金额"
        hkTip.font = UIFont.systemFont(ofSize: 16)
        hkTip.textAlignment = .center
        huanKuanContai.addSubview(hkTip)
        hkTip.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(10)
            make.height.equalTo(20)
        }
        
        let hkMoney = UILabel()//(frame: CGRect(x: 0, y: hkTip.frame.maxY + 5, width: huanKuanContai.frame.width, height: 20))
        hkMoney.text = dataSource?.repaymentAllMoney.description ?? ""+"元"
        hkMoney.textAlignment = .center
        hkMoney.font = UIFont.systemFont(ofSize: 15)
        hkMoney.textColor = UIColor.init(valueRGB: 0x986515)
        huanKuanContai.addSubview(hkMoney)
        hkMoney.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(hkTip.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        
        let hkDes = UILabel()//(frame: CGRect(x: 0, y: hkMoney.frame.maxY, width: huanKuanContai.frame.width, height: 20))
        hkDes.text = "(包含利息"+(dataSource?.interest.description ?? "")+"元)"
        hkDes.textAlignment = .center
        hkDes.font = UIFont.systemFont(ofSize: 14)
        hkDes.textColor = UIColor.init(valueRGB: 0x986515)
        huanKuanContai.addSubview(hkDes)
        hkDes.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(hkMoney.snp.bottom)
            make.height.equalTo(20)
        }
        
        
        let riQiContai = UIView()//(frame: CGRect(x: huanKuanContai.frame.maxX + 10, y: horiLine4.frame.maxY + 10, width: (container.frame.width - 30) / 2, height: 80))
        riQiContai.layer.borderColor = UIColor.theme.cgColor
        riQiContai.layer.borderWidth = 1
        riQiContai.layer.cornerRadius = 5
        container.addSubview(riQiContai)
        riQiContai.snp.makeConstraints { (make) in
            make.left.equalTo(huanKuanContai.snp.right).offset(10)
            make.top.equalTo(horiLine4.snp.bottom).offset(10)
            make.width.equalTo(huanKuanContai)
            make.height.equalTo(80)
        }
        
        let dateTip = UILabel()//(frame: CGRect(x: 0, y: 10, width: riQiContai.frame.width, height: 20))
        dateTip.text = "还款日期"
        dateTip.font = UIFont.systemFont(ofSize: 16)
        dateTip.textAlignment = .center
        riQiContai.addSubview(dateTip)
        dateTip.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(10)
            make.height.equalTo(20)
        }
        
        let date = UILabel()//(frame: CGRect(x: 0, y: dateTip.frame.maxY + 15, width: riQiContai.frame.width, height: 20))
        date.text = dataSource?.repaymentTime
        date.font = UIFont.systemFont(ofSize: 15)
        date.textAlignment = .center
        date.textColor = UIColor.init(valueRGB: 0x986515)
        riQiContai.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(dateTip.snp.bottom).offset(15)
            make.height.equalTo(20)
        }
        
//        container.frame.size = CGSize(width: width - 60, height: huanKuanContai.frame.maxY + 20)
//        let border = CAShapeLayer()
//        border.frame = container.bounds
//        border.path = UIBezierPath(roundedRect: border.bounds, cornerRadius: 5).cgPath
//        border.fillColor = UIColor.clear.cgColor
//        border.strokeColor = UIColor.theme.cgColor
//        border.lineWidth = 2
//        border.lineDashPattern = [10,5]
//        container.layer.addSublayer(border)
        
        let agreement = UIButton(type: .custom)
        agreement.isSelected = true
        agreement.setTitle("《贷款相关协议合同》", for: .normal)
        agreement.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        agreement.setTitleColor(UIColor.lightGray, for: .normal)
        agreement.setImage(#imageLiteral(resourceName: "agree_normal.png"), for: .normal)
        agreement.setImage(#imageLiteral(resourceName: "agree_select.png"), for: .selected)
        agreement.sizeToFit()
//        agreement.frame.origin = CGPoint(x: 30, y: container.frame.maxY + 20)
        agreement.addTarget(self, action: #selector(BorrowDetailVC.agreementClick(button:)), for: .touchUpInside)
        scrollView.addSubview(agreement)
        agreement.snp.makeConstraints { (make) in
            make.left.equalTo(container)
            make.top.equalTo(container.snp.bottom).offset(20)
            make.width.equalTo(agreement.frame.width)
            make.height.equalTo(20)
        }
        
        let confirm = UIButton(type: .custom)
//        confirm.frame = CGRect(x: 30, y: agreement.frame.maxY + 20, width: width - 60, height: 35)
        confirm.backgroundColor = UIColor.theme
        confirm.layer.cornerRadius = 5
        confirm.setTitle("确认", for: .normal)
        confirm.addTarget(self, action: #selector(BorrowDetailVC.submit), for: .touchUpInside)
        scrollView.addSubview(confirm)
        confirm.snp.makeConstraints { (make) in
            make.top.equalTo(agreement.snp.bottom).offset(20)
            make.width.equalTo(width - 60)
            make.height.equalTo(45)
            make.centerX.equalTo(scrollView)
            make.bottom.equalTo(-30)
        }
        
    
    }
    
    func agreementClick(button: UIButton) -> Void {
        button.isSelected = !button.isSelected
    }
    
    func submit() -> Void {
        navigationController?.pushViewController(ApplyVC(), animated: true)
    }
    
    
}
