//
//  JDAuthVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/17.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class JDAuthVC: BaseController, UIWebViewDelegate {
    
    lazy var webView: UIWebView = {
        let web = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        web.delegate = self
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.loadRequest(URLRequest(url: URL(string: "https://plogin.m.jd.com/user/login.action?appid=100")!))
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
//        switch navigationType {
//        case .linkClicked:
//            print("linkClicked")
//        case .backForward:
//            print("backForward")
//        case .formResubmitted:
//            print("formResubmitted")
//        case .formSubmitted:
//            print("formSubmitted")
//        case .other:
//            print("other")
//        case .reload:
//            print("reload")
//        }
//        print("链接==" + (request.url?.description)!)
//        print("host==", request.url?.host ?? "没有host")
//        print("path==", request.url?.path ?? "没有path")
//        print("absoluteString == ", request.url?.absoluteString ?? "没有absolute")
//        print("query==", request.url?.query ?? "么有quety")
        if (request.url?.query?.hasPrefix("sid="))! {
            startAnimating()
            webView.isHidden = true
            webView.loadRequest(NSURLRequest(url: URL(string: "https://btm.jd.com/?jdm=1&" + (request.url?.query)!)!) as URLRequest)
        }
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let str = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")
        print(str ?? "😢")
        if (webView.request?.url?.absoluteString.hasPrefix("https://btm.jd.com/"))! {
            navigationController?.pushViewController(JDAuthResultVC(), animated: true)
        }
        stopAnimating()
    }

}
