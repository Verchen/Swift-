//
//  BorrowDetailVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/15.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BorrowDetailVC: BaseController {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        scroll.alwaysBounceVertical = true
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "确认借款"
        
        view.addSubview(scrollView)
        
        setupUI()

    }
    
    func setupUI() -> Void {
        
        let width: CGFloat = UIScreen.main.bounds.width
        
        let container = UIView(frame: CGRect(x: 30, y: 30, width: width - 60, height: 200))
        scrollView.addSubview(container)
        
        let level = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        level.text = "LV1"
        level.textColor = UIColor.theme
        container.addSubview(level)
        
        let itemWidth = (container.frame.width - 20) / 3
        let daozhangTip = UILabel(frame: CGRect(x: 10, y: level.frame.maxY + 5, width: itemWidth, height: 20))
        daozhangTip.text = "到账金额"
        daozhangTip.textAlignment = .center
        daozhangTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(daozhangTip)
        
        let daoMoney = UILabel(frame: CGRect(x: 10, y: daozhangTip.frame.maxY + 5, width: itemWidth, height: 25))
        daoMoney.text = "850元"
        daoMoney.font = UIFont.systemFont(ofSize: 20)
        daoMoney.textColor = UIColor.init(valueRGB: 0x986515)
        daoMoney.textAlignment = .center
        container.addSubview(daoMoney)
        
        let line = UIView(frame: CGRect(x: daozhangTip.frame.maxX, y: level.frame.maxY, width: 1, height: 60))
        line.backgroundColor = UIColor.theme
        container.addSubview(line)
        
        let fuwuTip = UILabel(frame: CGRect(x: line.frame.maxX, y: daozhangTip.frame.minY, width: itemWidth, height: 20))
        fuwuTip.text = "服务费"
        fuwuTip.textAlignment = .center
        fuwuTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(fuwuTip)
        
        let fuwuMoney = UILabel(frame: CGRect(x: line.frame.maxX, y: daoMoney.frame.minY, width: itemWidth, height: 25))
        fuwuMoney.text = "150元"
        fuwuMoney.textColor = UIColor.init(valueRGB: 0x986515)
        fuwuMoney.textAlignment = .center
        fuwuMoney.font = UIFont.systemFont(ofSize: 20)
        container.addSubview(fuwuMoney)
        
        let line2 = UIView(frame: CGRect(x: fuwuTip.frame.maxX, y: level.frame.maxY, width: 1, height: 60))
        line2.backgroundColor = UIColor.theme
        container.addSubview(line2)
        
        let dayTip = UILabel(frame: CGRect(x: line2.frame.maxX, y: daozhangTip.frame.minY, width: itemWidth, height: 20))
        dayTip.text = "借款天数"
        dayTip.textAlignment = .center
        dayTip.font = UIFont.systemFont(ofSize: 14)
        container.addSubview(dayTip)
        
        let day = UILabel(frame: CGRect(x: line2.frame.maxX, y: daoMoney.frame.minY, width: itemWidth, height: 25))
        day.text = "30天"
        day.textColor = UIColor.init(valueRGB: 0x986515)
        day.textAlignment = .center
        day.font = UIFont.systemFont(ofSize: 20)
        container.addSubview(day)
        
        let horiLine = DottedView(frame: CGRect(x: 10, y: daoMoney.frame.maxY + 15, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine)
        
        let nameTip = UILabel(frame: CGRect(x: 10, y: horiLine.frame.maxY + 10, width: 100, height: 18))
        nameTip.text = "借款人"
        nameTip.font = UIFont.systemFont(ofSize: 15)
        nameTip.textColor = UIColor.lightGray
        container.addSubview(nameTip)
        
        let name = UILabel(frame: CGRect(x: 120, y: nameTip.frame.minY, width: container.frame.width - 130, height: 18))
        name.text = "张某某"
        name.font = UIFont.systemFont(ofSize: 15)
        name.textAlignment = .right
        container.addSubview(name)
        
        let horiLine2 = DottedView(frame: CGRect(x: 10, y: nameTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine2)
        
        let bankTip = UILabel(frame: CGRect(x: 10, y: horiLine2.frame.maxY + 10, width: 100, height: 18))
        bankTip.text = "所属银行"
        bankTip.font = UIFont.systemFont(ofSize: 15)
        bankTip.textColor = UIColor.lightGray
        container.addSubview(bankTip)
        
        let bank = UILabel(frame: CGRect(x: 120, y: bankTip.frame.minY, width: container.frame.width - 130, height: 18))
        bank.text = "招商银行"
        bank.font = UIFont.systemFont(ofSize: 15)
        bank.textAlignment = .right
        container.addSubview(bank)

        let horiLine3 = DottedView(frame: CGRect(x: 10, y: bankTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine3)
        
        let bankNumTip = UILabel(frame: CGRect(x: 10, y: horiLine3.frame.maxY + 10, width: 100, height: 18))
        bankNumTip.text = "入行卡号"
        bankNumTip.font = UIFont.systemFont(ofSize: 15)
        bankNumTip.textColor = UIColor.lightGray
        container.addSubview(bankNumTip)
        
        let bankNum = UILabel(frame: CGRect(x: 120, y: bankNumTip.frame.minY, width: container.frame.width - 130, height: 18))
        bankNum.text = "621661******9001"
        bankNum.font = UIFont.systemFont(ofSize: 15)
        bankNum.textAlignment = .right
        container.addSubview(bankNum)
        
        let horiLine4 = DottedView(frame: CGRect(x: 10, y: bankNumTip.frame.maxY + 10, width: container.frame.width - 20, height: 1))
        container.addSubview(horiLine4)
        
        let huanKuanContai = UIView(frame: CGRect(x: 10, y: horiLine4.frame.maxY + 10, width: (container.frame.width - 30) / 2, height: 80))
        huanKuanContai.layer.borderColor = UIColor.theme.cgColor
        huanKuanContai.layer.borderWidth = 1
        huanKuanContai.layer.cornerRadius = 5
        container.addSubview(huanKuanContai)
        
        let hkTip = UILabel(frame: CGRect(x: 0, y: 10, width: huanKuanContai.frame.width, height: 20))
        hkTip.text = "还款金额"
        hkTip.font = UIFont.systemFont(ofSize: 16)
        hkTip.textAlignment = .center
        huanKuanContai.addSubview(hkTip)
        
        let hkMoney = UILabel(frame: CGRect(x: 0, y: hkTip.frame.maxY + 5, width: huanKuanContai.frame.width, height: 20))
        hkMoney.text = "1111元"
        hkMoney.textAlignment = .center
        hkMoney.font = UIFont.systemFont(ofSize: 15)
        hkMoney.textColor = UIColor.init(valueRGB: 0x986515)
        huanKuanContai.addSubview(hkMoney)
        
        let hkDes = UILabel(frame: CGRect(x: 0, y: hkMoney.frame.maxY, width: huanKuanContai.frame.width, height: 20))
        hkDes.text = "(包含利息400元)"
        hkDes.textAlignment = .center
        hkDes.font = UIFont.systemFont(ofSize: 14)
        hkDes.textColor = UIColor.init(valueRGB: 0x986515)
        huanKuanContai.addSubview(hkDes)
        
        
        let riQiContai = UIView(frame: CGRect(x: huanKuanContai.frame.maxX + 10, y: horiLine4.frame.maxY + 10, width: (container.frame.width - 30) / 2, height: 80))
        riQiContai.layer.borderColor = UIColor.theme.cgColor
        riQiContai.layer.borderWidth = 1
        riQiContai.layer.cornerRadius = 5
        container.addSubview(riQiContai)
        
        let dateTip = UILabel(frame: CGRect(x: 0, y: 10, width: riQiContai.frame.width, height: 20))
        dateTip.text = "还款日期"
        dateTip.font = UIFont.systemFont(ofSize: 16)
        dateTip.textAlignment = .center
        riQiContai.addSubview(dateTip)
        
        let date = UILabel(frame: CGRect(x: 0, y: dateTip.frame.maxY + 15, width: riQiContai.frame.width, height: 20))
        date.text = "2022-12-12"
        date.font = UIFont.systemFont(ofSize: 15)
        date.textAlignment = .center
        date.textColor = UIColor.init(valueRGB: 0x986515)
        riQiContai.addSubview(date)
        
        container.frame.size = CGSize(width: width - 60, height: huanKuanContai.frame.maxY + 20)
        let border = CAShapeLayer()
        border.frame = container.bounds
        border.path = UIBezierPath(roundedRect: border.bounds, cornerRadius: 5).cgPath
        border.fillColor = UIColor.clear.cgColor
        border.strokeColor = UIColor.theme.cgColor
        border.lineWidth = 2
        border.lineDashPattern = [10,5]
        container.layer.addSublayer(border)
        
        let agreement = UIButton(type: .custom)
        agreement.isSelected = true
        agreement.setTitle("《贷款相关协议合同》", for: .normal)
        agreement.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        agreement.setTitleColor(UIColor.lightGray, for: .normal)
        agreement.setImage(#imageLiteral(resourceName: "agree_normal.png"), for: .normal)
        agreement.setImage(#imageLiteral(resourceName: "agree_select.png"), for: .selected)
        agreement.sizeToFit()
        agreement.frame.origin = CGPoint(x: 30, y: container.frame.maxY + 20)
        agreement.addTarget(self, action: #selector(BorrowDetailVC.agreementClick(button:)), for: .touchUpInside)
        scrollView.addSubview(agreement)
        
        let confirm = UIButton(type: .custom)
        confirm.frame = CGRect(x: 30, y: agreement.frame.maxY + 20, width: width - 60, height: 35)
        confirm.backgroundColor = UIColor.theme
        confirm.layer.cornerRadius = 5
        confirm.setTitle("确认", for: .normal)
        confirm.addTarget(self, action: #selector(BorrowDetailVC.submit), for: .touchUpInside)
        scrollView.addSubview(confirm)
        
    
    }
    
    func agreementClick(button: UIButton) -> Void {
        button.isSelected = !button.isSelected
    }
    
    func submit() -> Void {
        navigationController?.pushViewController(ApplyVC(), animated: true)
    }
    
    
}
