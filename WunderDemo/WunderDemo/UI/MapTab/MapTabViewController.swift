//
//  MapTabViewController.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit
import MapKit

class MapTabViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var presenter: PlaceMarkTabPresenterInput!
    private var carIntractor: PlaceMarkInteractorInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        setMapViewDelegate()
        initializePresenter()
        presenter.viewDidLoad()
    }
    
    private func initializePresenter(){
        presenter = PlaceMarkPresenter()
        carIntractor = PlaceMarkInteractor()
        carIntractor.output = presenter as? PlaceMarkInteractorOutput
        presenter.carView = self
        presenter.intractor = carIntractor
    }
    
    private func setMapViewDelegate(){
        mapView.delegate = self
    }
}

//MARK: PlaceMarkTabViewInput
extension MapTabViewController: PlaceMarkTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
        self.mapView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        activityIndicatorView.centerParent(of: self.mapView)
    }
    
    /**
     * Loop on each PlaceMark to add its marker on mapview
     */
    func showCars(for list: [Placemark]){
        list.forEach{
            addAnnotationForMapView(CLLocation(latitude: $0.long, longitude: $0.late),
                                    address: $0.name + ", " + $0.address,
                                    subtitle: $0.allInfoInOneLine)
        }
        if list.count > 0{
            zoomMap(byFactor: 0.01, centerLocation: (lat: list[0].long, long: list[0].late))
        }
    }
    
    func hideLoadingCars(){
        if activityIndicatorView.isDescendant(of: self.view) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
        }
    }
}

//MARK: MKMapViewDelegate
extension MapTabViewController: MKMapViewDelegate{
    
    /**
     * Zoom the mapview to center the markers
     */
    func zoomMap(byFactor delta: Double, centerLocation: (lat: Double, long: Double)) {
        var region: MKCoordinateRegion = self.mapView.region
        var span: MKCoordinateSpan = self.mapView.region.span
        span.latitudeDelta *= delta
        span.longitudeDelta *= delta
        region.span = span
        region.center.longitude = centerLocation.long
        region.center.latitude = centerLocation.lat
        mapView.setRegion(region, animated: true)
    }
    
    /**
     * MapView Delegate to show markers with MapView
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if (annotation is MKUserLocation) {
            return nil
        }
        let reuseID = "annotationID"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        if annotationView == nil {
            annotationView =  MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            annotationView?.image = UIImage(named: "car-icon2")
            annotationView?.canShowCallout = true
            annotationView?.annotation = annotation
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnMarker(_:))))
        return annotationView
    }
    
    /**
     * Show/Hide markers when click on one
     */
    @objc func didTapOnMarker(_ sender: UITapGestureRecognizer){
        guard let clikedMarker = sender.view as? MKAnnotationView,
            let clikedMarkerTitle = clikedMarker.annotation?.title else { return }
        
        func toggleSelectedMarker(_ selectedMarker: (MKAnnotation)) {
            if mapView.view(for: selectedMarker)?.alpha == 0{
                mapView.view(for: selectedMarker)?.alpha = 1
            }else{
                mapView.view(for: selectedMarker)?.alpha = 0
            }
        }
        
        mapView.annotations.forEach{
            let title = $0.title ?? ""
            if title != clikedMarkerTitle{
                toggleSelectedMarker($0)
            }else{
                mapView.view(for: $0)?.alpha = 1
            }
        }
    }
    
    /**
     * Add title and data for each Marker
     */
    fileprivate func addAnnotationForMapView(_ location: CLLocation?, address locationAddress: String, subtitle: String){
        if let coordinates = location?.coordinate{
            let mapAnnotation = MKPointAnnotation()
            mapAnnotation.title = locationAddress
            mapAnnotation.subtitle = subtitle
            mapAnnotation.coordinate = coordinates
            mapView.addAnnotation(mapAnnotation)
            mapView.selectAnnotation(mapAnnotation, animated: true)
        }
    }
}
