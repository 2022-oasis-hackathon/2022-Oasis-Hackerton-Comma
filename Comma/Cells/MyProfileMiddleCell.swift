//
//  MyProfileMiddleCell.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyProfileMiddleCell: UITableViewCell {
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    // UIButton
    @IBOutlet weak var workationButton: UIButton!
    @IBOutlet weak var longStayButton: UIButton!
    @IBOutlet weak var digitalNomadButton: UIButton!
    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 15
    let BUTTON_CORNER_RADIUS: CGFloat = 22
    let BUTTON_BORDER_WIDTH: CGFloat = 2
    let BUTTON_FONT_SIZE: CGFloat = 16
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_LABEL_FONT_SIZE)
        configureButton()
    }
    
    func configureButton() {
        workationButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
        longStayButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
        digitalNomadButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
        
        workationButton.layer.borderWidth = BUTTON_BORDER_WIDTH
        workationButton.layer.borderColor = ColorManager.shared.getThemeMain().cgColor
        workationButton.backgroundColor = ColorManager.shared.getFavoriteCategoryAbleColor()
        workationButton.setTitleColor(ColorManager.shared.getThemeMain(), for: .normal)
        workationButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        
        longStayButton.backgroundColor = ColorManager.shared.getFavoriteCategoryDisableColor()
        longStayButton.setTitleColor(.black, for: .normal)
        longStayButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        
        digitalNomadButton.backgroundColor = ColorManager.shared.getFavoriteCategoryDisableColor()
        digitalNomadButton.setTitleColor(.black, for: .normal)
        digitalNomadButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: BUTTON_FONT_SIZE)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
