//
//  FirstOnboardingVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import UIKit

class FirstOnboardingPageVC: UIViewController {
    // UILabel
    @IBOutlet weak var firstDescriptionLabel: UILabel!
    @IBOutlet weak var secondDescriptionLabel: UILabel!
    
    // UIImageView
    @IBOutlet weak var onBoardingImageView: UIImageView!
    
    // Variables
    var firstDescription: String!
    var secondDescription: String!
    var onBoardingImage: UIImage!
    
    // Constants
    let LABEL_FONT_SIZE: CGFloat = 15
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        // UILabel
        configureLabels()
        
        // UIImageView
        configureImage()
    }
    
    private func configureLabels() {
        firstDescriptionLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: LABEL_FONT_SIZE)
        secondDescriptionLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: LABEL_FONT_SIZE)
        firstDescriptionLabel.textColor = ColorManager.shared.getOnboardingLabelColor()
        secondDescriptionLabel.textColor = ColorManager.shared.getOnboardingLabelColor()
        firstDescriptionLabel.text = firstDescription
        secondDescriptionLabel.text = secondDescription
    }
    
    private func configureImage() {
        onBoardingImageView.image = onBoardingImage
    }
}
