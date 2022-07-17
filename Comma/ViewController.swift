//
//  ViewController.swift
//  Comma
//
//  Created by myungsun on 2022/07/15.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
       let button = UIButton(type:UIButton.ButtonType.custom)
       button.addTarget(self, action: #selector(showFlutterRoute), for: .touchUpInside)
       button.setTitle("Show Flutter!", for: UIControl.State.normal)
       button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
       button.tag = 1
       button.backgroundColor = UIColor.blue
       self.view.addSubview(button)
       
       
       let button2 = UIButton(type:UIButton.ButtonType.custom)
       button2.addTarget(self, action: #selector(showFlutterEntry), for: .touchUpInside)
       button2.tag = 2
       button2.setTitle("Show Flutter!", for: UIControl.State.normal)
       button2.frame = CGRect(x: 80.0, y: 260.0, width: 160.0, height: 40.0)
       button2.backgroundColor = UIColor.red
       self.view.addSubview(button2)
   }
   @objc func showFlutterRoute() {
       let flutterVC = CommaFlutterViewController(withEntrypoint: nil, route: "/comma")

       self.present(flutterVC, animated: true, completion: nil)
       
       // Storyboard에서 NavigationController import
       // self.navigationController?.pushViewController(flutterVC, animated: false)
   }
   
   @objc func showFlutterEntry() {
       let flutterVC = CommaFlutterViewController(withEntrypoint: nil, route: "/")
       self.present(flutterVC, animated: true, completion: nil)
       
       // Storyboard에서 NavigationController import
       // self.navigationController?.pushViewController(flutterVC, animated: true)
   }
}
