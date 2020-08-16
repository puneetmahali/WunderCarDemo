//
//  PlaceMarkInteractorInput.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

protocol PlaceMarkInteractorInput: class {
    
    var output: PlaceMarkInteractorOutput? { get set }

    func getCarsList()
}
