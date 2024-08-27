//
//  MenuViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 18/05/24.
//

import UIKit

class MenuViewController: UIViewController {
    var arrayofnames = ["Home","Offers","Settings","Wallet" ,"Help centre","LOG OUT"]
    var arrayofImages = ["house","discount","cogwheel","wallet","operator","logout"]
    @IBOutlet var tableVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        tableVw.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }
  
        
       
    }

extension MenuViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofnames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuLabels.text = arrayofnames[indexPath.row]
        cell.imageLabel.image = UIImage(named: arrayofImages[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var destinationController = UIViewController()
        let names = arrayofnames[indexPath.row]
        if names == "Home"{

          destinationController = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorViewController") as! SelectDoctorViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        
        else if names == "Offers"{

          destinationController = self.storyboard?.instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if  names == "Settings"{
            destinationController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")as! SettingsViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if  names == "Wallet"{
            destinationController = self.storyboard?.instantiateViewController(withIdentifier: "WalletViewController")as! WalletViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
        }
        else if  names == "Help centre"{
            destinationController = self.storyboard?.instantiateViewController(withIdentifier: "HelpCenterViewController")as! HelpCenterViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }
        else if  names == "LOG OUT"{
            UserDefaults.standard.setValue(false, forKey: "LoginKey")
                        UserDefaults.standard.synchronize()
            destinationController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
            let navController = UINavigationController.init(rootViewController: destinationController)
            navController.navigationBar.isHidden = true
            let reveal_Controller: SWRevealViewController = self.revealViewController()
            reveal_Controller.setFront(navController, animated: false)
            reveal_Controller.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    }

