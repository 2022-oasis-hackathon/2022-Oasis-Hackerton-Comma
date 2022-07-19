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
    var webView: WKWebView
    var isTopView: Bool
    var isBottomView: Bool
    
    private init() {}
    
    func configureWebView(isTopView: Bool, isBottomView: Bool) {
        
    }
    
    func getWebView(view: UIView, url: String) {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
                webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.preferences.javaScriptEnabled = true
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), configuration: webConfiguration)
        view.addSubview(webView)
        webView.load(request)
    }
}
