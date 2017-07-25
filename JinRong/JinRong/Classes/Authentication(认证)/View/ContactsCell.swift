//
//  ContactsCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    let name = UILabel()
    let relation = UILabel()
    let phoneNum = UILabel()
    let update = UILabel()
    
    var newModel : ContactsModel!
    var model: ContactsModel {
        get {
            return self.newModel
        }
        set {
            newModel = newValue
            
            name.text = newModel.name
            relation.text = newModel.relationId?.description
            phoneNum.text = newModel.tel
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI() -> Void {
        
        name.sizeToFit()
        name.frame = CGRect(x: 10, y: 10, width: name.frame.width, height: name.frame.height)
        contentView.addSubview(name)
        
        relation.textColor = UIColor.lightGray
        relation.font = UIFont.systemFont(ofSize: 16)
        relation.sizeToFit()
        relation.frame = CGRect(x: name.frame.maxX + 5, y: name.frame.maxY - relation.frame.height, width: relation.frame.width, height: relation.frame.height)
        contentView.addSubview(relation)
        
        phoneNum.sizeToFit()
        phoneNum.frame = CGRect(x: 10, y: name.frame.maxY + 10, width: phoneNum.frame.width, height: phoneNum.frame.height)
        contentView.addSubview(phoneNum)
        
        update.text = "修改"
        update.frame = CGRect(x: UIScreen.main.bounds.width - 70, y: 0, width: 70, height: 70)
        update.backgroundColor = UIColor.theme
        update.textAlignment = .center
        update.textColor = UIColor.white
        contentView.addSubview(update)
    }
    
}
