//
//  JourneyVC.swift
//  Comma
//
//  Created by 임채승 on 2022/07/19.
//

import UIKit
import WebKit

class JourneyVC: UIViewController {


    @IBOutlet weak var journeyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let webViewManager = WebViewManager.shared
        webViewManager.configureWebView(isTopView: false, isBottomView: true)
        webViewManager.getWebView(view: journeyView, viewcontoller: self ,url: "http://127.0.0.1:5500/CommaWebView/dist/html/home.html")
    }
}

extension JourneyVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String, body == "wando_detail" {
            let webViewManager = WebViewManager.shared
            webViewManager.configureWebView(isTopView: false, isBottomView: false)
            webViewManager.getWebView(view: UIView(), viewcontoller: self, url: "http://127.0.0.1:5500/CommaWebView/dist/html/wando_detail.html")
            
        }
    }
}
