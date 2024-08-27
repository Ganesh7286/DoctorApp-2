//
//  DataModel.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.


import UIKit

import Foundation

class DataModel: NSObject, Decodable {
    var Id: String?
    var Name: String?
    var ArabicName: String?
    var Description: String?
    var ContactNo: String?
    var ArabicContactNo: String?
    var Picture: String?
    var Sunday: String?
    var Monday: String?
    var Tuesday: String?
    var Wednesday: String?
    var Thursday: String?
    var Friday: String?
    var Saturday: String?
    var doctor_hospital: String?
    var Hospital: String?
    var HospitalArabicName: String?
    var HospitalLatitude: String?
    var HospitalLongitude: String?
    var HospitalCity: String?
    var HospitalArabicCity: String?
    var doctor_specialization: String?
    var Specialization: String?
    var SpecializationArabicTitle: String?
    var doctor_department: String?
    var Department: String?
    var DepartmentArabicTitle: String?
    var DoctorRating: String?
    var Disabled: String?
    
    enum CodingKeys: String, CodingKey {
        case Id, Name, ArabicName, Description, ContactNo, ArabicContactNo, Picture, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, doctor_hospital, Hospital, HospitalArabicName, HospitalLatitude, HospitalLongitude, HospitalCity, HospitalArabicCity, doctor_specialization, Specialization, SpecializationArabicTitle, doctor_department, Department, DepartmentArabicTitle, DoctorRating, Disabled
    }
    
    required override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Id = try? container.decode(String.self, forKey: .Id)
        Name = try? container.decode(String.self, forKey: .Name)
        ArabicName = try? container.decode(String.self, forKey: .ArabicName)
        Description = try? container.decode(String.self, forKey: .Description)
        ContactNo = try? container.decode(String.self, forKey: .ContactNo)
        ArabicContactNo = try? container.decode(String.self, forKey: .ArabicContactNo)
        Picture = try? container.decode(String.self, forKey: .Picture)
        Sunday = try? container.decode(String.self, forKey: .Sunday)
        Monday = try? container.decode(String.self, forKey: .Monday)
        Tuesday = try? container.decode(String.self, forKey: .Tuesday)
        Wednesday = try? container.decode(String.self, forKey: .Wednesday)
        Thursday = try? container.decode(String.self, forKey: .Thursday)
        Friday = try? container.decode(String.self, forKey: .Friday)
        Saturday = try? container.decode(String.self, forKey: .Saturday)
        doctor_hospital = try? container.decode(String.self, forKey: .doctor_hospital)
        Hospital = try? container.decode(String.self, forKey: .Hospital)
        HospitalArabicName = try? container.decode(String.self, forKey: .HospitalArabicName)
        HospitalLatitude = try? container.decode(String.self, forKey: .HospitalLatitude)
        HospitalLongitude = try? container.decode(String.self, forKey: .HospitalLongitude)
        HospitalCity = try? container.decode(String.self, forKey: .HospitalCity)
        HospitalArabicCity = try? container.decode(String.self, forKey: .HospitalArabicCity)
        doctor_specialization = try? container.decode(String.self, forKey: .doctor_specialization)
        Specialization = try? container.decode(String.self, forKey: .Specialization)
        SpecializationArabicTitle = try? container.decode(String.self, forKey: .SpecializationArabicTitle)
        doctor_department = try? container.decode(String.self, forKey: .doctor_department)
        Department = try? container.decode(String.self, forKey: .Department)
        DepartmentArabicTitle = try? container.decode(String.self, forKey: .DepartmentArabicTitle)
        DoctorRating = try? container.decode(String.self, forKey: .DoctorRating)
        Disabled = try? container.decode(String.self, forKey: .Disabled)
    }
}
