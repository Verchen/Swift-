//
//  SumCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/14.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class SumCell: UITableViewCell {

    var sumTip = UILabel()
    var willTip = UILabel()
    
    var sumMoney = UILabel()
    var willMoney = UILabel()
    
    var verticalLine = UIView()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func setupUI() -> Void {
        let width:CGFloat = UIScreen.main.bounds.width
        
        sumTip.frame = CGRect(x: 0, y: 10, width: width * 0.5, height: 20)
        sumTip.textAlignment = .center
        sumTip.text = "应还总额"
        contentView.addSubview(sumTip)
        
        sumMoney.frame = CGRect(x: 0, y: sumTip.frame.maxY + 5, width: width * 0.5, height: 40)
        sumMoney.font = UIFont.systemFont(ofSize: 30)
        sumMoney.textColor = UIColor.red
        let attributeStr = NSMutableAttributedString(string: "0.00元")
        attributeStr.addAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName : UIColor.black], range: NSRange(location: attributeStr.length - 1, length: 1))
        sumMoney.attributedText = attributeStr
        
        sumMoney.textAlignment = .center
        contentView.addSubview(sumMoney)
        
        verticalLine.frame = CGRect(x: width * 0.5, y: 10, width: 1, height: 85 - 20)
        verticalLine.backgroundColor = UIColor.theme
        contentView.addSubview(verticalLine)
        
        willTip.frame = CGRect(x: width * 0.5, y: 10, width: width * 0.5, height: 20)
        willTip.textAlignment = .center
        willTip.text = "未还金额"
        contentView.addSubview(willTip)
        
        willMoney.frame = CGRect(x: width / 2, y: willTip.frame.maxY + 5, width: width / 2, height: 40)
        willMoney.font = UIFont.systemFont(ofSize: 30)
        willMoney.textColor = UIColor.red
        let attributeStr2 = NSMutableAttributedString(string: "0.00元")
        attributeStr2.addAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName : UIColor.black], range: NSRange(location: attributeStr.length - 1, length: 1))
        willMoney.attributedText = attributeStr2
        willMoney.textAlignment = .center
        contentView.addSubview(willMoney)
    }
    
    

}
