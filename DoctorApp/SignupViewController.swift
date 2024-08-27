//
//  SignupViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var sixthTextField: UITextField!
    @IBOutlet var fifthTxtField: UITextField!
    @IBOutlet var fourthTextFld: UITextField!
    @IBOutlet var thirdTxtField: UITextField!
    @IBOutlet var secondTxtField: UITextField!
    @IBOutlet var firstTxtField: UITextField!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var numberLabel: UILabel!
    
    var phoneNumber: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor

        continueBtn.layer.cornerRadius = 10

        firstTxtField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        secondTxtField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        thirdTxtField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fourthTextFld.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fifthTxtField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        sixthTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        if let phoneNumber = phoneNumber {
            numberLabel.text = phoneNumber
        }
    }

    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func textFieldDidChange(textField: UITextField) {
        let text = textField.text ?? ""
        
        if text.count == 1 {
            switch textField {
            case firstTxtField:
                secondTxtField.becomeFirstResponder()
            case secondTxtField:
                thirdTxtField.becomeFirstResponder()
            case thirdTxtField:
                fourthTextFld.becomeFirstResponder()
            case fourthTextFld:
                fifthTxtField.becomeFirstResponder()
            case fifthTxtField:
                sixthTextField.becomeFirstResponder()
            case sixthTextField:
                sixthTextField.resignFirstResponder()
                validateOTP()
            default:
                break
            }
        } else if text.count == 0 {
            switch textField {
            case secondTxtField:
                firstTxtField.becomeFirstResponder()
            case thirdTxtField:
                secondTxtField.becomeFirstResponder()
            case fourthTextFld:
                thirdTxtField.becomeFirstResponder()
            case fifthTxtField:
                fourthTextFld.becomeFirstResponder()
            case sixthTextField:
                fifthTxtField.becomeFirstResponder()
            default:
                break
            }
        }
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated:  true)
    }
    @IBAction func tapsOnContinueBtnAct(_ sender: Any) {
        validateOTP()
    }
    
    func validateOTP() {
        
        let firstDigit = firstTxtField.text ?? ""
        let secondDigit = secondTxtField.text ?? ""
        let thirdDigit = thirdTxtField.text ?? ""
        let fourthDigit = fourthTextFld.text ?? ""
        let fifthDigit = fifthTxtField.text ?? ""
        let sixthDigit = sixthTextField.text ?? ""
        
        let otpInput = firstDigit + secondDigit + thirdDigit + fourthDigit + fifthDigit + sixthDigit
        
        if otpInput.count == 6, let _ = Int(otpInput) {
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            showAlert(withTitle: "Invalid OTP", withMessage: "Please enter a valid 6-digit OTP.")
        }
    }

    func showAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
