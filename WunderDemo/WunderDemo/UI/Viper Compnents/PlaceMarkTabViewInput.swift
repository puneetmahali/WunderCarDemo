//
//  PlaceMarkTabViewInput.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

protocol PlaceMarkTabViewInput: class {
    
    func showLoadingCarsError(_ message: String)
    
    func showLoadingCars()
    
    func showCars(for: [Placemark])
    
    func hideLoadingCars()
}
