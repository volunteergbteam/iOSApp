//
//  MainPageAPIExtention.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 27.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation
import MapKit
import FirebaseDatabase

extension MainPageViewController {
    private func setCurrentArea(){
        // check for closest location
        var minDist = 9999999.0
        let userLat = userLocation.latitude
        let userLon = userLocation.longitude
        for i in areas {
            let dist = distance(lat1:userLat, lon1:userLon, lat2:i.lat, lon2:i.lon)
            print(dist)
            if dist < minDist {
                minDist = dist
                currentArea = i
            }
        }
    }
    
    private func deg2rad(_ deg:Double) -> Double {
        return deg * .pi / 180
    }
    
    private func rad2deg(_ rad:Double) -> Double {
        return rad * 180.0 / .pi
    }

    private func distance(lat1:Double, lon1:Double, lat2:Double, lon2:Double) -> Double {
        let theta = lon1 - lon2
        var dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta))
        dist = acos(dist)
        dist = rad2deg(dist)
        return dist
    }
    
    private func setMapToCenterOfArea(){
        let center = CLLocationCoordinate2D(latitude: currentArea.lat, longitude: currentArea.lon)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(region, animated: true)
    }
    
    //MARK: - Firebase BD reading
    func readFireBaseData(){
        let semaphore = DispatchSemaphore(value: 0)
        
        ref = Database.database().reference()
        ref.child("areas").observeSingleEvent(of: .value, with: {[weak self] (snapshot) in
            
            // get array of areas
            guard let areasArray = snapshot.value as? Array<NSDictionary> else { return } // do something with error
            for (index, value) in areasArray.enumerated() {
                let id = index
                let title = value["title"] as? String ?? ""
                let lon = value["lon"] as? Double ?? 0
                let lat = value["lat"] as? Double ?? 0
                self?.areas.append(AreaModel(id: id, title: title, lon: lon, lat: lat))
            }
            // find closet area
            self?.setCurrentArea()
            semaphore.signal()
          }) { (error) in
            print(error.localizedDescription)
        }
        
        // wait to finish first call back
        _ = semaphore.wait(timeout: .distantFuture)
        
        // get all data for aread id
        let areaId = currentArea.id
        ref.child("events").child("\(areaId)").observeSingleEvent(of: .value, with: {[weak self] (snapshot) in
            guard let areasArray = snapshot.value as? Array<NSDictionary> else { return } // do something with error
            for (index, value) in areasArray.enumerated() {
                let id = index
                let title = value["title"] as? String ?? ""
                let lon = value["lon"] as? Double ?? 0
                let lat = value["lat"] as? Double ?? 0
                let expDate = value["expiration_date"] as? Int ?? 0
                let descr = value["description"] as? String ?? ""
                let status = value["status"] as? Int ?? 0
                let priority = value["priority"] as? Int ?? 0
                let ownerId = value["owner_id"] as? String ?? ""
                let creationDate = value["cration_date"] as? Int ?? 0
                let tempEvent = Event(id: id, creationDate: creationDate, description: descr,
                                      expirationDate: expDate, lat: lat, lon: lon, ownerId: ownerId,
                                      prioiry: priority, status: status, title: title)
                self?.eventsArray.append(tempEvent)
            }
            semaphore.signal()
          }) { (error) in
            print(error.localizedDescription)
        }
        
        
        // and finally put marks on map
        _ = semaphore.wait(timeout: .distantFuture)
        for event in eventsArray {
            let eventAnnotaion = EventAnnotation(id: event.id, title: event.title, priority: event.prioiry,
                                                 descr: event.description,
                                                 coordinate: CLLocationCoordinate2D(latitude: event.lat, longitude: event.lon))
            mapView.addAnnotation(eventAnnotaion)
        }
        
        DispatchQueue.main.async {
            self.setMapToCenterOfArea()
        }
    }
}
