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

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var askForHelpButton: MDCButton!
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Главная"
        
        // set menu bootton on nav controller
        let sideMenuButton = UIBarButtonItem(image: UIImage(named: "side_menu_img"), style: .plain, target: self, action: #selector(menuButtonAction(_:)))
        self.navigationItem.leftBarButtonItem  = sideMenuButton
        
        // setup map
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation)
        
        // setup button
        askForHelpButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        askForHelpButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        askForHelpButton.applyContainedTheme(withScheme: containerScheme)
        
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
    }
}

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
