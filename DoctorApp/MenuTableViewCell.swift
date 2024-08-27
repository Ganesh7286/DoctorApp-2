//
//  MenuTableViewCell.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var menuLabels: UILabel!
    @IBOutlet var imageLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
