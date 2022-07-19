//
//  MyPassportVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit
import RxSwift
import RxCocoa


class MyPassportVC: UIViewController {
    // UIButton
    @IBOutlet weak var chanllengeButton: UIButton!
    
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    // UIImageView
    @IBOutlet weak var stampImageView: UIImageView!
    
    // UIButton
    @IBOutlet weak var backButton: UIButton!
    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 18
    let BUTTON_FONT_SIZE: CGFloat = 16
    let BUTTON_CORNER_RADIUS: CGFloat = 10
    
    // RxSwift
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        action()
    }
    
    private func initUI() {
        // UINavigation
        self.navigationController?.navigationBar.isHidden = true
        
        // UILabel
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_LABEL_FONT_SIZE)
        
        // UIButton
        configureButton()
        addObserverFeature()
    }
    
    private func action() {
        // UIButton
        chanllengeButton.rx.tap
            .subscribe(onNext: { _ in
                let myLocationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyLocationVC") as! MyLocationVC
                
                myLocationVC.modalTransitionStyle = .crossDissolve
                myLocationVC.modalPresentationStyle = .overFullScreen
                self.present(myLocationVC, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        backButton.rx.tap
            .subscribe(onNext: { _ in
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func configureButton() {
        chanllengeButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        chanllengeButton.setTitleColor(.white, for: .normal)
        chanllengeButton.backgroundColor = .black
        chanllengeButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
    }
    
    private func addObserverFeature() {
        let notificationName = Notification.Name("sendBoolValue")
        NotificationCenter.default.addObserver(self, selector: #selector(changeStampImage(notification:)), name: notificationName, object: nil)
    }
    
    @objc private func changeStampImage(notification: Notification) {
        if let boolVal = notification.userInfo?["boolVal"] as? Bool {
            if boolVal {
                stampImageView.image = UIImage(named: "CompletedStampYeosu")
            }
        }
    }
}
