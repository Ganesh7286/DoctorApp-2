//
//  RegistrationViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var mobileTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        nextBtn.layer.cornerRadius = 10
        mobileTf.layer.borderColor = UIColor.black.cgColor
        mobileTf.layer.borderWidth = 1.0
        mobileTf.layer.cornerRadius = 5.0
        mobileTf.clipsToBounds = true
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        
        mobileTf.delegate = self
        mobileTf.keyboardType = .numberPad
    }

    @IBAction func loginBTn(_ sender: Any) {
        if let phoneNumber = mobileTf.text, isValidPhoneNumber(phoneNumber) {
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
            if let signupVC = vc {
                signupVC.phoneNumber = phoneNumber
                self.navigationController?.pushViewController(signupVC, animated: true)
            }
        } else {
            showAlert(withTitle: "Invalid Phone Number", withMessage: "Please enter a valid 10-digit phone number.")
        }
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
    
    func showAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated:  true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        return newLength <= 10
    }
}
