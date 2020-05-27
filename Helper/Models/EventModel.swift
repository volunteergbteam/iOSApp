//
//  EventModel.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 27.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation
import MapKit

struct Event {
    var id: Int
    var creationDate: Int
    var description: String
    var expirationDate: Int
    var lat: Double
    var lon: Double
    var ownerId: String
    var prioiry: Int
    var status: Int
    var title: String
}

class EventAnnotation: NSObject, MKAnnotation {
    let id: Int?
    let title: String?
    let priority: Int?
    let coordinate: CLLocationCoordinate2D
    let descr: String?
    
    init(id: Int?, title: String?, priority: Int?, descr: String?, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.title = title
        self.priority = priority
        self.coordinate = coordinate
        self.descr = descr
        super.init()
    }
    
    var subtitle: String? {
        return descr
    }
    
    var image: UIImage {
      guard let priority = priority else {
        return #imageLiteral(resourceName: "Group 14")
      }

      switch priority {
      case 0:
        return #imageLiteral(resourceName: "Group 14")
      case 1:
        return #imageLiteral(resourceName: "Group 15")
      case 2:
        return #imageLiteral(resourceName: "Fire")
      default:
        return #imageLiteral(resourceName: "Group 14")
      }
    }
}

