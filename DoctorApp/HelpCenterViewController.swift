//
//  HelpCenterViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class HelpCenterViewController: UIViewController {
var arrayofnames = ["Communication preferences","Your Messages","Deal alerts","Wish List","Profile","Your Recommendations"]
    @IBOutlet var tableVw: UITableView!
    @IBOutlet var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
        tableVw.register(UINib(nibName: "HelpTableViewCell", bundle: nil), forCellReuseIdentifier: "HelpTableViewCell")
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let revealController : SWRevealViewController = self.revealViewController()
        backBtn.addTarget(revealController, action: #selector(SWRevealViewController().revealToggle(_:)), for: .touchUpInside)
    
    }
    
    
}
extension HelpCenterViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofnames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HelpTableViewCell", for: indexPath) as! HelpTableViewCell
        cell.settingsLabel.text = arrayofnames[indexPath.row]
       return cell
    }
    
    
}
