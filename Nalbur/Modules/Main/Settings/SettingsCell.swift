//
//  SettingsCell.swift
//  Nalbur
//
//  Created by MERT MUTLU on 14.04.2024.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var lblSettingsName: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
