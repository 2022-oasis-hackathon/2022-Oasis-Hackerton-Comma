//
//  LoginVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import UIKit
import RxSwift
import RxCocoa
import KakaoSDKAuth
import KakaoSDKUser

class LoginVC: UIViewController {
    // UIButton
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    // Constants
    let BUTTON_RADIUS: CGFloat = 10
    
    // RxSwift
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        action()
    }
    
    private func initUI() {
        // UIButton
        configureButtons()
    }
    
    private func action() {
        kakaoLoginButton.rx.tap
            .subscribe(onNext: { _ in
                if (UserApi.isKakaoTalkLoginAvailable()) {
                   // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                       if let error = error {
                           // 예외 처리 (로그인 취소 등)
                           print(error)
                       }
                       else {
                           
                       }
                   }
                 }
            })
            .disposed(by: disposeBag)
    
    }
    
    private func configureButtons() {
        appleLoginButton.layer.cornerRadius = BUTTON_RADIUS
        kakaoLoginButton.layer.cornerRadius = BUTTON_RADIUS
    }
}
