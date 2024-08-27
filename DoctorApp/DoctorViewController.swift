//
//  DoctorViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//
import UIKit
class DoctorViewController: UIViewController {
    @IBOutlet var imageL: UIImageView!
    @IBOutlet var hospitalLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var specializationLabel: UILabel!
    
    @IBOutlet var bookApp: UIButton!
    var doctor: DataModel?
    var selectedDateTime: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookApp.layer.cornerRadius = 10
        let backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1.0)
                view.backgroundColor = backgroundColor
        
        if let doctor = doctor {
            nameLabel.text = doctor.Name
            hospitalLabel.text = doctor.HospitalArabicName
            departmentLabel.text = doctor.Department
            specializationLabel.text = doctor.Specialization
            
            if let imageURLString = doctor.Picture,
               let encodedImageURLString = imageURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let imageURL = URL(string: encodedImageURLString) {
                imageL.af.setImage(withURL: imageURL)
            }
        }
    }
    
    @IBAction func bookAppointment(_ sender: Any) {
        showDateTimePicker()
    }
    
   
    func showDateTimePicker() {
        let dateTimePicker = UIDatePicker()
        dateTimePicker.datePickerMode = .dateAndTime
        dateTimePicker.addTarget(self, action: #selector(dateTimeChanged(_:)), for: .valueChanged)

        let alertController = UIAlertController(title: "Select Date and Time", message: nil, preferredStyle: .actionSheet)
        alertController.view.addSubview(dateTimePicker)

        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            self.selectedDateTime = dateTimePicker.date
            self.navigateToAppointmentList()
        }
        alertController.addAction(doneAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

       func navigateToAppointmentList() {
           guard let selectedDateTime = selectedDateTime else { return }

           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           guard let appointmentListVC = storyboard.instantiateViewController(withIdentifier: "DateViewController") as? DateViewController else { return }
           appointmentListVC.selectedDateTime = selectedDateTime
           navigationController?.pushViewController(appointmentListVC, animated: true)
       }

       @objc func dateTimeChanged(_ sender: UIDatePicker) {
          
       }
   }
