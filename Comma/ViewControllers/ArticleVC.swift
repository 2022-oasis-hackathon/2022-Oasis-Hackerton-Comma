//
//  ArticleVC.swift
//  Comma
//
//  Created by 임채승 on 2022/07/20.
//

import UIKit
import WebKit

class ArticleVC: UIViewController {
    // UIView
    @IBOutlet weak var articleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let webViewManager = WebViewManager.shared
        webViewManager.configureWebView(isTopView: false, isBottomView: true)
        webViewManager.getWebView(view: articleView, viewcontoller: self ,url: "/CommaWebView/dist/html/travler.html")
    }
}

extension ArticleVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String, body == "travler_detail" {
            let webViewManager = WebViewManager.shared
            webViewManager.configureWebView(isTopView: false, isBottomView: false)
            webViewManager.getWebView(view: UIView(), viewcontoller: self, url: "/CommaWebView/dist/html/travler_detail.html")
        }
    }
}
