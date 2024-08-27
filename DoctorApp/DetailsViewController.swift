//
//  DetailsViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 18/05/24.
//

import UIKit

class DetailsViewController: UIViewController {

    
    
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var conformTxtFld: UITextField!
    @IBOutlet var passwordTxtFld: UITextField!
    @IBOutlet var PhTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
            
        firstNameTextField.layer.borderColor = UIColor.black.cgColor
        firstNameTextField.layer.borderWidth = 1.0
        firstNameTextField.layer.cornerRadius = 5.0
        firstNameTextField.clipsToBounds = true
        lastNameTextField.layer.borderColor = UIColor.black.cgColor
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.cornerRadius = 5.0
        lastNameTextField.clipsToBounds = true
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 5.0
        emailTextField.clipsToBounds = true
        PhTextField.layer.borderColor = UIColor.black.cgColor
        PhTextField.layer.borderWidth = 1.0
        PhTextField.layer.cornerRadius = 5.0
        PhTextField.clipsToBounds = true
        passwordTxtFld.layer.borderColor = UIColor.black.cgColor
        passwordTxtFld.layer.borderWidth = 1.0
        passwordTxtFld.layer.cornerRadius = 5.0
        passwordTxtFld.clipsToBounds = true
        conformTxtFld.layer.borderColor = UIColor.black.cgColor
        conformTxtFld.layer.borderWidth = 1.0
        conformTxtFld.layer.cornerRadius = 5.0
        conformTxtFld.clipsToBounds = true
        
        registerBtn.layer.cornerRadius  = registerBtn.frame.size.height/2
    }
    @IBAction func tapsOnRegisterBtnActn(_ sender: Any) {
        if firstNameTextField.text?.count == 0{
            showAlert(withTitle: "Alert", withMessage: "First Name")
        }else if lastNameTextField.text?.count == 0{
            showAlert(withTitle: "Alert", withMessage: "Last Name")
        }else if emailTextField.text?.count == 0{
            showAlert(withTitle: "Alert", withMessage: "Email")
        
        }else if passwordTxtFld.text?.count == 0{
            showAlert(withTitle: "Alert", withMessage: "Password")
        }else if conformTxtFld.text?.count == 0{
            showAlert(withTitle: "Alert", withMessage: "Conform Password")
        }else {
            print(firstNameTextField.text ?? "")
            print(lastNameTextField.text ?? "")
            print(emailTextField.text ?? "")
            print(passwordTxtFld.text ?? "")
            print(conformTxtFld.text ?? "")
            _ = UIViewController()
            UserDefaults.standard.set(true, forKey: "LoginKey")
            UserDefaults.standard.synchronize()
            _ = UIApplication.shared.connectedScenes.first
            if let selectDoctorVC = storyboard?.instantiateViewController(withIdentifier: "SelectDoctorViewController") as? SelectDoctorViewController {
               
                navigationController?.pushViewController(selectDoctorVC, animated: true)
            }

        }
    }

    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        //    let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        //    })
        alert.addAction(ok)
        //    alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated:  true)
    }
}
extension DetailsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
