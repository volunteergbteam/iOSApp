//
//  EventsViews.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 27.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation
import MapKit

class EventView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let event = newValue as? EventAnnotation else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            image = event.image
        }
    }
}
