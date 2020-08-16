//
//  API.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

enum Servers{
    
    public static let DEVUrl = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios/"
}

class API {
    public static let BASE_URL = Servers.DEVUrl
}

enum APIPath: String{
    case locations = "locations.json"
    
    var path: String{
        return API.BASE_URL + rawValue
    }
}
