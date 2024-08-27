//
//  OffersTableViewCell.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class OffersTableViewCell: UITableViewCell {

    @IBOutlet var backGround: UIView!
    @IBOutlet var nextBooking: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var tabletImage: UIImageView!
    @IBOutlet var starsLabel: UIImageView!
    @IBOutlet var dollersLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
