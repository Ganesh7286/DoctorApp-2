//
//  DateViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 18/05/24.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    var selectedDateTime: Date?

    @IBOutlet var returnHomeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        returnHomeBtn.layer.cornerRadius = 10

        if let selectedDateTime = selectedDateTime {
            datePicker.date = selectedDateTime
        }
    }
    @IBAction func BackButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectDoctorViewController") as? SelectDoctorViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
