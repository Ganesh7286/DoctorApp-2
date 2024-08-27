//
//  SelectDoctorViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 18/05/24.
//

import UIKit


import UIKit


class SelectDoctorViewController: UIViewController {
    @IBOutlet var menuButton: UIButton!
    @IBOutlet var seheduleBtn: UIButton!
    @IBOutlet var pharmacyBtn: UIButton!
    @IBOutlet var hospitalBtn: UIButton!
    @IBOutlet var doctorBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        self.navigationItem.hidesBackButton = true
        if let revealController = self.revealViewController() {
            if let menuButton = menuButton {
                menuButton.addTarget(revealController, action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                view.addGestureRecognizer(revealController.panGestureRecognizer())
                view.addGestureRecognizer(revealController.tapGestureRecognizer())
            }
           
        }
    }
    @IBAction func doctorBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func findHospitalBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func findPharamcyBtn(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func seheduleBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
