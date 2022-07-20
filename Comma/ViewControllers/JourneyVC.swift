//
//  JourneyVC.swift
//  Comma
//
//  Created by 임채승 on 2022/07/19.
//

import UIKit
import WebKit


class JourneyVC: UIViewController {
    // UIView
    @IBOutlet weak var journeyView: UIView!
    
    // UIButton
    @IBOutlet weak var backButton: UIButton!
    
    // UILbael
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let webViewManager = WebViewManager.shared
        webViewManager.configureWebView(isTopView: false, isBottomView: true)
        webViewManager.getWebView(view: journeyView, viewcontoller: self ,url: "/CommaWebView/dist/html/home.html")
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
    }
}

extension JourneyVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String, body == "wando_detail" {
            let webViewManager = WebViewManager.shared
            webViewManager.configureWebView(isTopView: false, isBottomView: false)
            webViewManager.getWebView(view: UIView(), viewcontoller: self, url: "/CommaWebView/dist/html/wando_detail.html")
            
        }
        
        if let body = message.body as? String, body == "wando" {
            self.titleLabel.alpha = 1
            self.backButton.alpha = 1
            self.titleLabel.textColor = .white
            self.backButton.tintColor = .white
            let webViewManager = WebViewManager.shared
            webViewManager.configureWebView(isTopView: false, isBottomView: false)
            webViewManager.getWebView(view: UIView(), viewcontoller: self, url: "/CommaWebView/dist/html/wando.html")
        }
    }
}
