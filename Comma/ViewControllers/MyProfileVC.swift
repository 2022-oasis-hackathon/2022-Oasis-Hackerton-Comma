//
//  MyProfileVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI(){
        // UINavigationController
        self.navigationController?.navigationBar.isHidden = true
    }
}
