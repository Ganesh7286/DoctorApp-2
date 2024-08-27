//
//  HelpTableViewCell.swift
//  DoctorApp
//
//  Created by sravan yadav on 20/05/24.
//

import UIKit

class HelpTableViewCell: UITableViewCell {

    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var settingsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
