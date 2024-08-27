//
//  WalletViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backBtn(_ sender: Any) {
        let revealController : SWRevealViewController = self.revealViewController()
        backBtn.addTarget(revealController, action: #selector(SWRevealViewController().revealToggle(_:)), for: .touchUpInside)
    
    }
}
