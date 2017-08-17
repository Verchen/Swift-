//
//  EmailAuthVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/8/16.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class EmailAuthVC: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let web = UIWebView(frame: view.bounds)
        view.addSubview(web)
        web.loadRequest(URLRequest.init(url: URL(string: "https://m.rong360.com/web_crawler/union/ec?token=d367abe96d16c48b5ca0fef4078811e4")!))
        
    }

}
