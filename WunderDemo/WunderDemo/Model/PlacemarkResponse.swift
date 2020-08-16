//
//  PlacemarkResponse.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import ObjectMapper

public class PlacemarkResponse: Mappable{
    
    private var _placemarksList : [Placemark]?
    
    var placemarksList : [Placemark]{
        return _placemarksList ?? []
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _placemarksList <- map["placemarks"]
   }
}
