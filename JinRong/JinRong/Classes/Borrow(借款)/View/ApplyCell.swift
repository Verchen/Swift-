//
//  ApplyCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/13.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import SnapKit

class ApplyCell: UITableViewCell {
    
    var containerView = UIView()
    
    var levelIcon = UIImageView()
    var levelText = UILabel()
    
    var verticalLine = UIImageView()
    var numberTip = UILabel()
    var moneyLabel = UILabel()
    
    var dateTime = UILabel()
    var horizontalLine = UIImageView()
    
    var rightIcon = UIImageView()
    
    var lockView = UIView()
    
    var newModel: BorrowModel!
    
    var model: BorrowModel {
        get {
            return self.newModel
        }
        set {
            newModel = newValue
            levelText.text = "LV"+String(newModel.lv)
            moneyLabel.text = newModel.money+"元"
            dateTime.text = String(newModel.day)+"天"
            if newModel.lock == 1 {
                levelIcon.image = #imageLiteral(resourceName: "lock_open.png")
                lockView.isHidden = true
            }else{
                levelIcon.image = #imageLiteral(resourceName: "lock.png")
                lockView.isHidden = false
            }            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
        setupLayout()
    }
    
    func setupUI() -> Void {
        containerView.layer.borderColor = UIColor.theme.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 5.0
        containerView.clipsToBounds = true
        
        levelIcon.image = #imageLiteral(resourceName: "lock.png")
        levelText.text = "LV1"
        levelText.textAlignment = .center
        levelText.textColor = UIColor.theme
        
        verticalLine.image = UIImage.colorImage(color: UIColor.theme)
        
        numberTip.text = "借款金额"
        numberTip.textAlignment = .center
        numberTip.textColor = UIColor.theme
        moneyLabel.text = "700元"
        moneyLabel.font = UIFont.systemFont(ofSize: 25.0)
        moneyLabel.textAlignment = .center
        moneyLabel.textColor = UIColor.theme
        
        dateTime.text = "14天"
        dateTime.textColor = UIColor.theme
        dateTime.textAlignment = .center
        
        horizontalLine.image = UIImage.colorImage(color: UIColor.theme)
        
        rightIcon.image = #imageLiteral(resourceName: "right_icon.png")
        
        lockView = UIView()
        lockView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        contentView.addSubview(containerView)
        containerView.addSubview(levelIcon)
        containerView.addSubview(levelText)
        containerView.addSubview(verticalLine)
        containerView.addSubview(numberTip)
        containerView.addSubview(moneyLabel)
        containerView.addSubview(dateTime)
        containerView.addSubview(horizontalLine)
        containerView.addSubview(rightIcon)
        containerView.addSubview(lockView)
    }
    
    func setupLayout() -> Void {
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.bottom.equalTo(-5)
            make.right.equalTo(-10)
        }
        
        levelIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.width.height.equalTo(45)
        }
        
        levelText.snp.makeConstraints { (make) in
            make.top.equalTo(levelIcon.snp.bottom).offset(5)
            make.left.right.equalTo(levelIcon)
        }
        
        verticalLine.snp.makeConstraints { (make) in
            make.left.equalTo(levelIcon.snp.right).offset(10)
            make.width.equalTo(1)
            make.top.bottom.equalTo(0)
        }
        
        numberTip.snp.makeConstraints { (make) in
            make.left.equalTo(verticalLine.snp.right).offset(5)
            make.right.equalTo(horizontalLine.snp.left).offset(-5)
            make.top.equalTo(15)
        }
        
        moneyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numberTip.snp.bottom).offset(10)
            make.left.right.equalTo(numberTip)
        }
        
        rightIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.right.equalTo(-10)
            make.centerY.equalTo(containerView)
        }
        
        horizontalLine.snp.makeConstraints { (make) in
            make.right.equalTo(rightIcon.snp.left).offset(-10)
            make.centerY.equalTo(containerView).offset(10)
            make.height.equalTo(1)
            make.width.equalTo(50)
        }
        
        dateTime.snp.makeConstraints { (make) in
            make.bottom.equalTo(horizontalLine.snp.top).offset(-5)
            make.left.right.equalTo(horizontalLine)
        }
        
        lockView.snp.makeConstraints { (make) in
            make.edges.equalTo(containerView)
        }
        
    }
}
