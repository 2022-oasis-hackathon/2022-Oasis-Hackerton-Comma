//
//  WebViewManager.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import Foundation
import UIKit
import WebKit

class WebViewManager {
    static let shared = WebViewManager()
    var isTopView = false
    var isBottomView = false
    
    private init() {}
    
    func configureWebView(isTopView: Bool, isBottomView: Bool) {
        self.isTopView = isTopView
        self.isBottomView = isBottomView
    }
    
    func getWebView(view: UIView, viewcontoller: UIViewController, url: String) {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
                webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.preferences.javaScriptEnabled = true
        let url = URL(string: "http://127.0.0.1:5500" + url)
        let request = URLRequest(url: url!)
        
        if (self.isBottomView) {
            let contentController = WKUserContentController()
            contentController.add(viewcontoller as! WKScriptMessageHandler, name: "scriptHandler")
            webConfiguration.userContentController = contentController
            
            let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), configuration: webConfiguration)
            view.addSubview(webView)
            webView.load(request)
        } else {
            let fullWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullWebViewVC") as! FullWebViewVC
            let fullWebViewParrent = fullWebViewVC.view
            
            let contentController = WKUserContentController()
            contentController.add(fullWebViewVC as! WKScriptMessageHandler, name: "scriptHandler")
            webConfiguration.userContentController = contentController
            
            let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: fullWebViewParrent!.bounds.width, height: fullWebViewParrent!.bounds.height), configuration: webConfiguration)
            fullWebViewParrent?.addSubview(webView)
            webView.load(request)
            
            fullWebViewVC.modalPresentationStyle = .overFullScreen
            viewcontoller.present(fullWebViewVC, animated: true)
        }
    }
}
