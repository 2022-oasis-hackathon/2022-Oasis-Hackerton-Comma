//
//  MyPageTopCell.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyPageTopCell: UITableViewCell {
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Constants
    let TITLE_FONT_SIZE: CGFloat = 24
    let DECRIPTION_FONT_SIZE: CGFloat = 20
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoBold(fontSize: TITLE_FONT_SIZE)
        descriptionLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: DECRIPTION_FONT_SIZE)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
