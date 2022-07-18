//
//  AppDelegate.swift
//  Comma
//
//  Created by myungsun on 2022/07/15.
//

import UIKit
import FirebaseCore
import Flutter
import FlutterPluginRegistrant
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        KakaoSDK.initSDK(appKey: "a3a37a0160bf556ddbe890c40d6eba91")
        return true
      }
    
    // MARK: UISceneSession Lifecycle

    override func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

