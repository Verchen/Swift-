//
//  SMSButton.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/20.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class SMSButton: UIButton {

    var time = 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("获取验证码", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() -> Void {
        isEnabled = false
        backgroundColor = backgroundColor?.withAlphaComponent(0.5)
        time -= 1
        if time<=0 {
            time = 60
            isEnabled = true
            backgroundColor = backgroundColor?.withAlphaComponent(1)
            setTitle("重新获取", for: .normal)
            return
        }
        setTitle(self.time.description + "秒后重试", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.start()
        }
    }
    
}
