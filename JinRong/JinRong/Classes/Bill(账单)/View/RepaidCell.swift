//
//  RepaidCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/14.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class RepaidCell: UITableViewCell {
    
    var level = UILabel()
    var money = UILabel()
    var repayState = UILabel()
    var creatTime = UILabel()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        accessoryType = .disclosureIndicator
        
        let width: CGFloat = UIScreen.main.bounds.width
        
        money.frame = CGRect(x: 20, y: 10, width: 150, height: 20)
        money.text = "5000"
        contentView.addSubview(money)
        
        level.frame = CGRect(x: 20, y: money.frame.maxY + 5, width: 150, height: 20)
        level.text = "LV1借款"
        level.font = UIFont.systemFont(ofSize: 15)
        level.textColor = UIColor.lightGray
        contentView.addSubview(level)
        
        repayState.frame = CGRect(x: 150, y: 10, width: width - 190, height: 20)
        repayState.textAlignment = .right
        repayState.text = "已还款"
        contentView.addSubview(repayState)
        
        creatTime.frame = CGRect(x: 150, y: repayState.frame.maxY + 5, width: width - 190, height: 20)
        creatTime.text = "2017.2.2借"
        creatTime.textAlignment = .right
        creatTime.font = UIFont.systemFont(ofSize: 15)
        creatTime.textColor = UIColor.lightGray
        contentView.addSubview(creatTime)
        
    }
}
