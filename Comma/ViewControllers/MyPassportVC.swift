//
//  MyPassportVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyPassportVC: UIViewController {
    // UIButton
    @IBOutlet weak var chanllengeButton: UIButton!
    
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 18
    let BUTTON_FONT_SIZE: CGFloat = 16
    let BUTTON_CORNER_RADIUS: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        // UINavigation
        self.navigationController?.navigationBar.isHidden = true
        
        // UILabel
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_LABEL_FONT_SIZE)
        
        // UIButton
        configureButton()
    }
    
    private func configureButton() {
        chanllengeButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        chanllengeButton.setTitleColor(.white, for: .normal)
        chanllengeButton.backgroundColor = .black
        chanllengeButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
    }
}
