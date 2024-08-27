//
//  OffersViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 19/05/24.
//

import UIKit

class OffersViewController: UIViewController {
    var arrayofTablet = ["medicine","drugs","medicine","drugs","medicine"]
    var arrayofImges = ["five-stars-rating-icon-vector","Empty","five-stars-rating-icon-vector","Empty","five-stars-rating-icon-vector"]
    var arrayofdoller = ["$20","$15","$20","$15","$20"]
    var arrayofViewColor = ["Brinjal","system Yellow","Brinjal","System Yellow","Brinjal"]
    
    @IBOutlet var backBtn: UIButton!
    
    @IBOutlet var tableVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
            
        tableVw.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
    }
    

  
    @IBAction func backBtn(_ sender: Any) {
        let revealController : SWRevealViewController = self.revealViewController()
        backBtn.addTarget(revealController, action: #selector(SWRevealViewController().revealToggle(_:)), for: .touchUpInside)
    
    }
}
extension OffersViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell") as! OffersTableViewCell
        cell.selectionStyle = .none
        cell.tabletImage.image = UIImage(named: arrayofTablet[indexPath.row])
        cell.starsLabel.image = UIImage(named: arrayofImges[indexPath.row])
        cell.starsLabel.frame = CGRectMake(0,0,62,62);
        cell.dollersLabel.text = arrayofdoller[indexPath.row]
        switch indexPath.row % 4 {
           case 0:
               cell.backGround.backgroundColor = .systemPurple
           case 1:
               cell.backGround.backgroundColor = .systemYellow
           case 2:
               cell.backGround.backgroundColor = .systemPurple
           case 3:
               cell.backGround.backgroundColor = .systemYellow
           default: break
           }
        switch indexPath.row % 4 {
           case 1:
               cell.saveLabel.textColor = .black
              cell.nextBooking.textColor = .black
           case 3:
               cell.saveLabel.textColor = .black
            cell.nextBooking.textColor = .black
           default: break
           }
        
        return cell
        
    }
}

