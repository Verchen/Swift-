//
//  BankCardCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BankCardCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        contentView.addSubview(bankIcon)
        contentView.addSubview(bankName)
        contentView.addSubview(cardNum)
        contentView.addSubview(stateImage)
    }
    
    func setupLayout() -> Void {
        bankIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.width.height.equalTo(35)
            make.bottom.equalTo(-10)
        }
        
        bankName.snp.makeConstraints { (make) in
            make.left.equalTo(bankIcon.snp.right).offset(10)
            make.height.equalTo(bankIcon)
            make.top.equalTo(10)
            make.right.equalTo(cardNum.snp.left).offset(-10)
        }
        
        cardNum.snp.makeConstraints { (make) in
            make.left.equalTo(bankName.snp.right).offset(10)
            make.top.equalTo(10)
            make.height.equalTo(bankIcon)
            make.right.equalTo(stateImage.snp.left).offset(-10)
        }
        
        stateImage.snp.makeConstraints { (make) in
            make.left.equalTo(cardNum.snp.right).offset(10)
            make.top.equalTo(10)
            make.height.width.equalTo(bankIcon)
            make.right.equalTo(-10)
        }
    }
    
    lazy var bankIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var bankName: UILabel = {
        let name = UILabel()
        return name
    }()
    
    lazy var cardNum: UILabel = {
        let num = UILabel()
        num.font = UIFont.systemFont(ofSize: 15)
        return num
    }()
    
    lazy var stateImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
}
