//
//  MapViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        checkLocaionStatus()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(_:)))
        self.view.addGestureRecognizer(longPressGesture)
        
    }
    
    private var locationManager: CLLocationManager {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
    }
    
    private func checkLocaionStatus() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            goToSettingsAlert()
        case .notDetermined:
                locationManager.requestWhenInUseAuthorization()

        @unknown default:
            fatalError()
        }
    }

    @objc func handleLongGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Selected Adress"
        mapView.addAnnotation(annotation)
    }
    
//    under comment use for function description.
/**
     Show to alert for app settings.
     */
    
    func goToSettingsAlert(){
//        Add Alert Controller
        let alert = UIAlertController(title: "Location Permission need to use map location", message: "Settings>MapExample>Location>Access", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Ayarlara Gonder")
            let url = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!)!
                              
                               UIApplication.shared.open(url)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        Need to show alert use present for self view controller
        present(alert, animated: true, completion: nil)
    }
}


extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latitudeLabel.text = "latitude: \(String(describing: locations.first?.coordinate.latitude))"
        longitudeLabel.text = "longitude: \(String(describing: locations.first?.coordinate.longitude))"
        
        if let coordinate = locations.first?.coordinate {
            mapView.setCenter(coordinate, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocaionStatus()
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
