//
//  PlaceMarkTabPresenterInput.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

protocol PlaceMarkTabPresenterInput: class {
    
    var intractor: PlaceMarkInteractorInput! { get set }
    
    var carView: PlaceMarkTabViewInput? { get set }
    
    func viewDidLoad()
}

