//
//  ViewController.swift
//  Comma
//
//  Created by myungsun on 2022/07/15.
//

import UIKit

class CourseRegisterVC: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        
   }
    @IBAction func tapButton(_ sender: Any) {
        let testVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestVC")
        testVC.modalPresentationStyle = .overFullScreen
        self.present(testVC, animated: true)
    }
}
