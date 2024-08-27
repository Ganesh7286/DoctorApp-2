//
//  MapViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 20/05/24.
//
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
  var locationManager: CLLocationManager!
  var mapView: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()
    mapView = MKMapView(frame: self.view.bounds)
    mapView.delegate = self
    self.view.addSubview(mapView)
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
  }
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    let status = manager.authorizationStatus
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      
      locationManager.startUpdatingLocation()
      mapView.showsUserLocation = true
      
      centerMapOnUserLocation()
    case .denied:
      print("User denied location authorization.")
      showAlert(title: "Location Permission Denied", message: "This app needs location access to show your current position. Please go to Settings to enable it.")
    case .restricted:
      print("Location authorization restricted.")
      showAlert(title: "Location Permission Restricted", message: "Your device location settings might be restricted. Please check with the device administrator.")
    case .notDetermined:
      print("Location authorization not yet determined.")
    @unknown default:
      print("Unknown location authorization status")
    }
  }
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    
    DispatchQueue.main.async {
      self.mapView.setRegion(region, animated: true)
    }
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Failed to find user's location: \(error.localizedDescription)")
  }
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
        if let url = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url)
      }
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(settingsAction)
    alertController.addAction(cancelAction)
    present(alertController, animated: true)
  }
  func centerMapOnUserLocation() {
    guard let userLocation = locationManager.location else {
      print("Unable to get user location for centering map.")
      return
    }
    let center = userLocation.coordinate
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    mapView.setRegion(region, animated: true)
  }
}

