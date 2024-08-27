//
//  HomeViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 14/05/24.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeViewController: UIViewController {
   
    var apiDicArray: [DataModel] = []
    var filteredData: [DataModel] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var selectedDateTime: Date?
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
        
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        self.activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
       
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
       
        displayWelcomeDialog {
            self.activityIndicator.startAnimating()
            self.fetchData()
        }
    }

    func displayWelcomeDialog(completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: "Welcome!", message: "Please Wait", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func fetchData() {
        guard let url = URL(string: "https://newdrcom.azurewebsites.net/DoctorsList.aspx") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let apiData = try jsonDecoder.decode([DataModel].self, from: data)
                self.apiDicArray = apiData
                self.filteredData = self.apiDicArray
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let dataModel = filteredData[indexPath.row]
        cell.nameLabel.text = dataModel.Name
        cell.specializationLabel.text = dataModel.Specialization
        cell.departmentLabel.text = dataModel.Department
        cell.hospitalNameLabel.text = dataModel.HospitalArabicName
        
        if let imageURLString = dataModel.Picture, let imageURL = URL(string: imageURLString) {
            cell.imageLabel.af.setImage(withURL: imageURL, completion: { response in
                if case .success(let image) = response.result {
                    let aspectRatio = image.size.width / image.size.height
                    let newWidth = cell.imageLabel.bounds.height * aspectRatio
                    cell.imageLabel.frame.size.width = min(newWidth, cell.contentView.bounds.width)
                    cell.layoutIfNeeded()
                }
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDoctor = filteredData[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DoctorViewController") as? DoctorViewController {
            vc.doctor = selectedDoctor
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = apiDicArray.filter { dataModel in
            return dataModel.Name?.range(of: searchText, options: .caseInsensitive) != nil
        }
        tableView.reloadData()
    }
}
