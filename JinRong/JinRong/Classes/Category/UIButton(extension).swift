//
//  UIButton(extension).swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/13.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    open class func vertical(image: UIImage, title: String, textColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.sizeToFit()
        
        let imageViewX:CGFloat = (button.frame.width - (button.imageView?.frame.width)!) * 0.5
        let imageViewSize = button.imageView?.frame.size
        let titleLabelSize = button.titleLabel?.frame.size
        
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageViewSize?.width)!, -(imageViewSize?.height)! - 5, 0)
        button.imageEdgeInsets = UIEdgeInsetsMake(-(titleLabelSize?.height)! - 5, imageViewX, 0, 0)
        
        button.frame = CGRect(x: button.frame.minX, y: button.frame.minY, width: button.frame.width, height: (imageViewSize?.height)! + (titleLabelSize?.height)! + 10)
        
        return button
    }
    
}
