//
//  TestVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit
import WebKit

class FullWebViewVC: UIViewController {
    // UIButton
    @IBOutlet weak var backButton: UIButton!
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        // TODO: 뒤로 가기 버튼 이벤트 추가
        self.dismiss(animated: true)
    }
}

extension FullWebViewVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String, body == "back" {
            self.dismiss(animated: true)
        }
//        webView.evaluateJavaScript("document.getElementById('someElement').innerText") { (result, error) in
//            if error == nil {
//                print(result)
//            }
//        }
    }
}
