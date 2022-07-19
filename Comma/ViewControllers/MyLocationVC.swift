//
//  MyLocationVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/20.
//

import UIKit
import RxSwift
import RxCocoa

class MyLocationVC: UIViewController {
    // UILabel
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    // UIButton
    @IBOutlet weak var locationSearchButton: UIButton!
    
    // RxSwift
    let disposeBag = DisposeBag()
    
    // Constants
    let LABEL_FONT_SIZE: CGFloat = 24
    let BUTTON_FONT_SIZE: CGFloat = 16
    let BUTTON_CORNER_RADIUS: CGFloat = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        action()
    }
    
    private func initUI() {
        // UILabel
        configureLabels()
        
        // UIButton
        configureButton()
    }
    
    private func action() {
        locationSearchButton.rx.tap
            .subscribe(onNext: { _ in
                let presentView = self.presentingViewController
                
                self.dismiss(animated: false) {
                    let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapVC") as! MapVC
                    
                    mapVC.modalTransitionStyle = .crossDissolve
                    mapVC.modalPresentationStyle = .overFullScreen
                    presentView?.present(mapVC, animated: false, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func configureLabels() {
        firstTitleLabel.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: LABEL_FONT_SIZE)
        secondTitleLabel.font = FontManager.shared.getAppleSDGothicNeoLight(fontSize: LABEL_FONT_SIZE)
    }
    
    private func configureButton() {
        locationSearchButton.backgroundColor = .black
        locationSearchButton.setTitleColor(.white, for: .normal)
        locationSearchButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        locationSearchButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
    }
}
