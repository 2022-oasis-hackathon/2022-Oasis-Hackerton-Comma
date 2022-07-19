//
//  MyProfileTopCell.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyProfileTopCell: UITableViewCell {
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // Constatns
    let TITLE_FONT_SIZE: CGFloat = 15
    let CORNER_RADIUS: CGFloat = 8
    let TEXT_FIELD_FONT_SIZE: CGFloat = 16
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_FONT_SIZE)
        nameTextField.layer.cornerRadius = CORNER_RADIUS
        nameTextField.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TEXT_FIELD_FONT_SIZE)
        nameTextField.addLeftPadding()
        nameTextField.text = "Eddy"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
