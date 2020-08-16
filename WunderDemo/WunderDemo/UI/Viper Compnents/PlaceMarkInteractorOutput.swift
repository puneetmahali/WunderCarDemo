//
//  PlaceMarkInteractorOutput.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

protocol PlaceMarkInteractorOutput: class {
    
    func showLoadingCars()
    
    func hideLoadingCars()
    
    func showCars(for: [Placemark])
    
    func showLoadingCarsError(_ message: String)
}
