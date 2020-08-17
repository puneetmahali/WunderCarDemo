//
//  SingleMapPinViewController.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 17.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class SingleMapPinViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var late : Double!
    var long : Double!
    var carName = ""
    var carAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = carName
        
        let location = CLLocationCoordinate2D(latitude: long, longitude:late)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        
        let pin = customPin(pinTitle: carName, pinSubTitle: carAddress, location: location)
        self.mapView.addAnnotation(pin)
    
    }

    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named:"car-icon2")
        annotationView.canShowCallout = true
        return annotationView
    }
}
