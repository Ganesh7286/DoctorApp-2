//
//  ViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
            
    }

    @IBAction func letsButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

