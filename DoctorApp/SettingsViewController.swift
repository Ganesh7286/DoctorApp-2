//
//  SettingsViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
      
      
    }
    @IBAction func backBtn(_ sender: Any) {
        let revealController : SWRevealViewController = self.revealViewController()
        backBtn.addTarget(revealController, action: #selector(SWRevealViewController().revealToggle(_:)), for: .touchUpInside)
    
    }
    
    
    }

