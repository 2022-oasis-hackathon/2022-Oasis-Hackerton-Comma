//
//  yeomFlutterViewController.swift
//  Comma
//
//  Created by 임채승 on 2022/07/17.
//

import Flutter
import FlutterPluginRegistrant
import Foundation

/**
 @interface FlutterViewController
     : UIViewController <FlutterTextureRegistry, FlutterPluginRegistry, UIGestureRecognizerDelegate>
 #else
 @interface FlutterViewController : UIViewController <FlutterTextureRegistry, FlutterPluginRegistry>
 #endif
 */
class CommaFlutterVC: FlutterViewController{
    private var flutterEngine: FlutterEngine?
    private var methodChnnel: FlutterMethodChannel?
    
    init(withEntrypoint entryPoint: String?, route: String?) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        flutterEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil, initialRoute: route)
        GeneratedPluginRegistrant.register(with: flutterEngine!)
        super.init(engine: flutterEngine!, nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.methodChnnel = FlutterMethodChannel(name: "Comma-channel", binaryMessenger: self.binaryMessenger)
        // Flutter -> Native Call
        self.methodChnnel?.setMethodCallHandler({
            [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { return }
            print("GyeomFlutterViewController methodChnnel: \(call.method)")
        })
        // Native -> Flutter Call
        self.methodChnnel?.invokeMethod("swift-to-flutter", arguments: "hello", result: {
            (result) -> Void in
            print("swift-to-flutter result: \(result)")
        })
    }
}
