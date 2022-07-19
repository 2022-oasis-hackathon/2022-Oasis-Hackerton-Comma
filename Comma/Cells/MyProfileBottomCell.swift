//
//  MyProfileBottomCell.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyProfileBottomCell: UITableViewCell {
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 15
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_LABEL_FONT_SIZE)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
