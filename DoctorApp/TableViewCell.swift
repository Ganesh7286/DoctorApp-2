//
//  TableViewCell.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specializationLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
