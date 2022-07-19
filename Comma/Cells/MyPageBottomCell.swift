//
//  MyPageBottomCell.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyPageBottomCell: UITableViewCell {
    // UIView
    @IBOutlet weak var lineView: UIView!
    
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    // Constants
    let TITLE_FONT_SIZE: CGFloat = 18
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: TITLE_FONT_SIZE)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
