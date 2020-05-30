//
//  AddEventVC.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 30.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MapKit

class AddEventVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Попросить о помощи"
        mapView.delegate = self
        
        let locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        adressTextField.addTarget(self, action: #selector(adressFieldDidChange), for: .editingDidEnd)
        adressTextField.inputAccessoryView = getToolBar()
    }
    
    func getStringForLocation(location: CLLocationCoordinate2D){
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let _ = error {
                // handle error
                print("ERROR")
            } else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    self.adressTextField.text = placemark.name
                } else {
                    // handle error
                    print("ANOTHER ERROR")
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
            manager.stopUpdatingLocation()
            
            // add point
            let annotation = MKPointAnnotation()
            annotation.coordinate = mapView.region.center
            mapView.addAnnotation(annotation)
            getStringForLocation(location: center)
        }
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapView.region.center
        mapView.addAnnotation(annotation)
        getStringForLocation(location: annotation.coordinate)
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapView.region.center
        mapView.addAnnotation(annotation)
    }
    
    @objc func adressFieldDidChange(_ textField: UITextField){
        guard let text = textField.text else { return }
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(text) {[weak self] (placemarks, error) in
            if let _ = error {
                // handle error
            } else {
                guard let placemarks = placemarks, let location = placemarks.first?.location else { return }
                let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                self?.mapView.setRegion(region, animated: true)
                self?.mapView.removeAnnotations(self!.mapView.annotations)
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                               longitude: location.coordinate.longitude)
                self?.mapView.addAnnotation(annotation)
            }
        }
    }
}
