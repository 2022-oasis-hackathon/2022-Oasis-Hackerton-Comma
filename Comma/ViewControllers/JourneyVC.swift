//
//  JourneyVC.swift
//  Comma
//
//  Created by 임채승 on 2022/07/19.
//

import UIKit


class JourneyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveButton(_ sender: Any) {
        let webViewManager = WebViewManager.shared
        webViewManager.getWebView(view: UIView(), viewcontoler: self ,url: "http://127.0.0.1:5500/CommaWebView/dist/html/wando.html#videoSection")
    }
    
}
