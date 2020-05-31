//
//  AddEventVC.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 30.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MapKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import MaterialComponents.MaterialNavigationDrawer
import FirebaseDatabase
import FirebaseAuth

class AddEventVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addEventButton: MDCButton!
    @IBOutlet weak var priorityView: UISegmentedControl!
    
    var ref: DatabaseReference!
    var userLocation: CLLocationCoordinate2D!
    var areaId: Int!
    var currentLocation = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Попросить о помощи"
        mapView.delegate = self
        mapView.showsBuildings = true
        mapView.removeAnnotations(mapView.annotations)
        
        let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        
        let locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        adressTextField.addBottomBorder()
        adressTextField.inputAccessoryView = getToolBar()
        adressTextField.addTarget(self, action: #selector(adressFieldDidChange), for: .editingDidEnd)
        adressTextField.addTarget(self, action: #selector(checkFieldsForContent), for: .editingChanged)
        
        titleTextField.addBottomBorder()
        titleTextField.inputAccessoryView = getToolBar()
        titleTextField.addTarget(self, action: #selector(checkFieldsForContent), for: .editingChanged)
        
        descriptionTextView.delegate = self
        descriptionTextView.addBottomBorder()
        descriptionTextView.inputAccessoryView = getToolBar()
        descriptionTextView.textColor = UIColor.lightGray
        
        // setup button
        addEventButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        addEventButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        addEventButton.applyContainedTheme(withScheme: containerScheme)
        addEventButton.addTarget(self, action: #selector(addEventAction), for: .touchUpInside)
        addEventButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func addEventAction(_ sender: UIButton){
        guard let title = titleTextField.text, let descr = descriptionTextView.text,
            let user    = Auth.auth().currentUser else { return }
        
        let lat         = currentLocation.latitude
        let lon         = currentLocation.longitude
        let priority    = priorityView.selectedSegmentIndex
        let timestamp   = NSDate().timeIntervalSince1970
        let ownerId     = user.uid
        let status      = 0
        
        runActivityIndicator()
        ref = Database.database().reference()
        guard let key = ref.child("events").child("\(areaId ?? 100)").childByAutoId().key else { return }
        let post = ["creation_date": timestamp, "lat": lat, "lon": lon,
                    "owner_id": ownerId, "description": descr, "priority": priority,
                    "status": status, "title": title] as [String : Any]
        let childUpdates = ["/events/\(areaId ?? 100)/\(key)": post]
        
        ref.updateChildValues(childUpdates) {[weak self] (error, ref) in
            self?.stopActivityIndicator()
            if let error = error {
                self?.showBasicAlert(title: "Упс. Что-то пошло не так.", message: error.localizedDescription)
            } else {
                let alert = UIAlertController(title: "Ура", message: "Ваша просьба отправлена всем добровольцам в вашем районе. Когда кто-то откликнется, вам придет сообщение.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Понятно", style: .cancel, handler: nil)
                alert.addAction(okAction)
                self?.present(alert, animated: true, completion: {
                    DispatchQueue.main.async {
                        self?.navigationController?.popToRootViewController(animated: true)
                    }
                })
            }
        }
    }
    
    @objc func checkFieldsForContent(){
        guard let titleText = titleTextField.text, titleText.count > 0,
            descriptionTextView.text.count > 0, descriptionTextView.text != "Подробное описание",
            let adressText = adressTextField.text, adressText.count > 0 else {
                addEventButton.isEnabled = false
                return
        }
        
        addEventButton.isEnabled = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension UITextField {
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
}

extension UITextView {
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        layer.addSublayer(bottomLine)
    }
}

// MARK: - Keyboard
extension AddEventVC {
    @objc func keyboardWillShow(notification:NSNotification){

        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

//MARK: - Text fileds
extension AddEventVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        checkFieldsForContent()
    }
}

// MARK: - Map ext

extension AddEventVC {
    func getStringForLocation(location: CLLocationCoordinate2D){
        currentLocation = location
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
        if let _ = locations.last {
            manager.stopUpdatingLocation()
        }
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapView.region.center
        mapView.addAnnotation(annotation)
        getStringForLocation(location: annotation.coordinate)
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
                self?.currentLocation = center
            }
        }
    }
}
