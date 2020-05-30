//
//  MainPageViewController.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 13.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MapKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import MaterialComponents.MaterialNavigationDrawer
import FirebaseDatabase

class MainPageViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var askForHelpButton: MDCButton!
    @IBOutlet weak var searchField: UITextField!
    
    var ref: DatabaseReference!
    var userLocation = CLLocationCoordinate2D()
    var areas: [AreaModel] = []
    var currentArea: AreaModel!
    var eventsArray: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Главная"
        
        // set menu bootton on nav controller
        let sideMenuButton = UIBarButtonItem(image: UIImage(named: "side_menu_img"), style: .plain, target: self, action: #selector(menuButtonAction(_:)))
        self.navigationItem.leftBarButtonItem = sideMenuButton
        
        // set view for annotation
        mapView.register(EventView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // setup button
        askForHelpButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        askForHelpButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        askForHelpButton.applyContainedTheme(withScheme: containerScheme)
        askForHelpButton.addTarget(self, action: #selector(addEventAction), for: .touchUpInside)
        
        //setup search field
        searchField.inputAccessoryView = getToolBar()
        searchField.backgroundColor = .white
        searchField.layer.cornerRadius = 25
        searchField.layer.borderColor = UIColor.clear.cgColor
        searchField.setIcon(#imageLiteral(resourceName: "uil_search"))
        
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(#imageLiteral(resourceName: "uil_sliders-v-alt"), for: .normal)
        filterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        filterButton.frame = CGRect(x: searchField.frame.size.width - 25, y: 5, width: 25, height: 25)
        //filterButton.addTarget(self, action: #selector(self.eyeButtonAction), for: .touchDown)
        searchField.rightView = filterButton
        searchField.rightViewMode = .always
        
        searchField.layer.masksToBounds = false
        searchField.layer.shadowRadius = 3.0
        searchField.layer.shadowColor = UIColor.black.cgColor
        searchField.layer.shadowOffset = CGSize(width: 1, height: 1)
        searchField.layer.shadowOpacity = 0.3
        
        // get reauest for location
        let locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        DispatchQueue.global().async {
            self.readFireBaseData()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            userLocation.latitude = location.coordinate.latitude
            userLocation.longitude = location.coordinate.longitude
            //mapView.setRegion(region, animated: true)
        }
    }
    
    @objc func addEventAction(_ sender: UIButton){
        self.navigationController?.pushViewController(AddEventVC(), animated: true)
    }
}
