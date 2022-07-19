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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func moveButton(_ sender: Any) {
        let webViewManager = WebViewManager.shared
        webViewManager.getWebView(view: UIView(), viewcontoler: self ,url: "http://127.0.0.1:5500/CommaWebView/dist/html/wando.html#videoSection")
    }
    
}
