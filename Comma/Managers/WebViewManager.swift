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
<<<<<<< HEAD
//    static let shared = WebViewManager()
////    var webView: WKWebView
////    var isTopView: Bool
////    var isBottomView: Bool
//
//    private init() {}
//
//    func configureWebView(isTopView: Bool, isBottomView: Bool) {
//
//    }
//
//    func getWebView(view: UIView, url: String) {
//        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.allowsInlineMediaPlayback = true
//                webConfiguration.mediaTypesRequiringUserActionForPlayback = []
//        webConfiguration.preferences.javaScriptEnabled = true
//        let url = URL(string: url)
//        let request = URLRequest(url: url!)
//        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), configuration: webConfiguration)
//        view.addSubview(webView)
//        webView.load(request)
//    }
=======
    static let shared = WebViewManager()
    var isTopView = false
    var isBottomView = false
    
    private init() {}
    
    func configureWebView(isTopView: Bool, isBottomView: Bool) {
        self.isTopView = isTopView
        self.isBottomView = isBottomView
    }
    
    func getWebView(view: UIView, viewcontoler: UIViewController, url: String) {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
                webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.preferences.javaScriptEnabled = true
        
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        
        if (self.isBottomView) {
            let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), configuration: webConfiguration)
            view.addSubview(webView)
            webView.load(request)

        } else {
            let fullWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullWebViewVC") as! FullWebViewVC
            let fullWebViewParrent = fullWebViewVC.view
            
            let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: fullWebViewParrent!.bounds.width, height: fullWebViewParrent!.bounds.height), configuration: webConfiguration)
            fullWebViewParrent?.addSubview(webView)
            webView.load(request)
            
            fullWebViewVC.modalPresentationStyle = .overFullScreen
            viewcontoler.present(fullWebViewVC, animated: true)
        }
    }
>>>>>>> b3017a15b6ae1e8798c93227d3b9312197cc4fb3
}
