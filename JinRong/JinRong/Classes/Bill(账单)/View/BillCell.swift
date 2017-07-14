//
//  BillCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/14.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {
    //应还总额
    var sumLabel = UILabel()
    //本金栏容器
    var containerView1 = UIImageView()
    //本金
    var rootMoney = UILabel()
    //本金值
    var rootMoneyValue = UILabel()
    //利息
    var interest = UILabel()
    //利息值
    var interestValue = UILabel()
    //还款方式容器
    var containerView2 = UIImageView()
    //还款方式
    var repayType = UILabel()
    //还款方式值
    var repayTypeValue = UILabel()
    //到期时间
    var deadline = UILabel()
    //到期时间值
    var deadlineValue = UILabel()
    //立即还款
    var repayButton = UIButton()
    
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = 30
        
        sumLabel.frame = CGRect(x: 10, y: 0, width: width, height: height)
        sumLabel.text = "借款金额6000元  |   14天期限"
        contentView.addSubview(sumLabel)
        
        containerView1.frame = CGRect(x: 0, y: sumLabel.frame.maxY, width: width, height: height)
        containerView1.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(containerView1)
        
        rootMoney.frame = CGRect(x: 10, y: 0, width: 100, height: height)
        rootMoney.textColor = UIColor.white
        rootMoney.text = "本金"
        containerView1.addSubview(rootMoney)
        
        rootMoneyValue.frame = CGRect(x: width - 100, y: 0, width: width - 110, height: height)
        rootMoneyValue.textColor = UIColor.white
        rootMoneyValue.text = "5000"
        rootMoneyValue.textAlignment = .right
        containerView1.addSubview(rootMoneyValue)
        
        interest.frame = CGRect(x: 10, y: containerView1.frame.maxY, width: 150, height: height)
        interest.text = "利息／服务费"
        contentView.addSubview(interest)
        
        interestValue.frame = CGRect(x: 100, y: containerView1.frame.maxY, width: width - 110, height: height)
        interestValue.textAlignment = .right
        interestValue.text = "1000"
        contentView.addSubview(interestValue)
        
        containerView2.frame = CGRect(x: 0, y: interest.frame.maxY, width: width, height: height)
        containerView2.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(containerView2)
        
        repayType.frame = CGRect(x: 10, y: 0, width: 100, height: height)
        repayType.textColor = UIColor.white
        repayType.text = "还款方式"
        containerView2.addSubview(repayType)
        
        repayTypeValue.frame = CGRect(x: 100, y: 0, width: width - 110, height: height)
        repayTypeValue.textColor = UIColor.white
        repayTypeValue.textAlignment = .right
        repayTypeValue.text = "等额本金"
        containerView2.addSubview(repayTypeValue)
        
        deadline.frame = CGRect(x: 10, y: containerView2.frame.maxY, width: 100, height: height)
        deadline.text = "到期时间"
        contentView.addSubview(deadline)
        
        deadlineValue.frame = CGRect(x: 100, y: containerView2.frame.maxY, width: width - 110, height: height)
        deadlineValue.textAlignment = .right
        deadlineValue.text = "明天"
        contentView.addSubview(deadlineValue)
        
        repayButton.frame = CGRect(x: 0, y: deadline.frame.maxY, width: width, height: 1.5 * height)
        repayButton.setTitle("立即还款", for: .normal)
        repayButton.setTitleColor(UIColor.white, for: .normal)
        repayButton.setBackgroundImage(UIImage.colorImage(color: UIColor.theme), for: .normal)
        contentView.addSubview(repayButton)
    }
}
