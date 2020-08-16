//
//  PlaceMarkPresenter.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

class PlaceMarkPresenter: PlaceMarkTabPresenterInput{
    
    weak var carView: PlaceMarkTabViewInput?
    var intractor: PlaceMarkInteractorInput!
    
    func viewDidLoad() {
        intractor.getCarsList()
    }
}

//MARK: CarTabInteractorOutput
extension PlaceMarkPresenter: PlaceMarkInteractorOutput{
    
    func showLoadingCarsError(_ message: String) {
        carView?.showLoadingCarsError(message)
    }
    
    func showCars(for list: [Placemark]){
        carView?.showCars(for: list)
    }
    
    func showLoadingCars(){
        carView?.showLoadingCars()
    }
    
    func hideLoadingCars(){
        carView?.hideLoadingCars()
    }
}
