//
//  StampVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/20.
//

import UIKit
import RxSwift
import RxCocoa

class StampVC: UIViewController {
    // UILabel
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    // UIView
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var completionContainerView: UIView!
    
    // UIButton
    @IBOutlet weak var checkStampButton: UIButton!
    
    // Constants
    let LABEL_FONT_SIZE: CGFloat = 20
    let SUB_LABEL_FONT_SIZE: CGFloat = 14
    let BUTTON_FONT_SIZE: CGFloat = 18
    let BUTTON_CORNER_RADIUS: CGFloat = 10
    let VIEW_CORNER_RADIUS: CGFloat = 10
    
    // RxSwift
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        action()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animateViews()
    }
    
    private func initUI() {
        // UILabel
        configureLabels()
        
        // UIView
        containerView.alpha = 1
        completionContainerView.layer.cornerRadius = VIEW_CORNER_RADIUS
        
        // UIButton
        configureButton()
    }
    
    private func action() {
        checkStampButton.rx.tap
            .subscribe(onNext: { _ in
                let notificationName = Notification.Name("sendBoolValue")
                let boolDic = ["boolVal" : true]
                
                NotificationCenter.default.post(name: notificationName, object: nil, userInfo: boolDic)
                self.dismiss(animated: true)
                self.view.window!.rootViewController?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func configureLabels() {
        firstLabel.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: LABEL_FONT_SIZE)
        let attributedString = NSMutableAttributedString(string: firstLabel.text!)
        attributedString.addAttribute(.foregroundColor, value: ColorManager.shared.getStampColor(), range: (firstLabel.text! as NSString).range(of: "7일차"))
        attributedString.addAttribute(.font, value: FontManager.shared.getAppleSDGothicNeoExtraBold(fontSize: LABEL_FONT_SIZE), range: (firstLabel.text! as NSString).range(of: "7일차"))
        firstLabel.attributedText = attributedString
        secondLabel.font = FontManager.shared.getAppleSDGothicNeoLight(fontSize: SUB_LABEL_FONT_SIZE)
    }
    
    private func configureButton() {
        checkStampButton.setTitleColor(.white, for: .normal)
        checkStampButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
        checkStampButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: BUTTON_FONT_SIZE)
    }
    
    private func animateViews() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
        } completion: { _ in
            self.containerView.alpha = 0.65
            self.view.layoutIfNeeded()
        }
    }
}
