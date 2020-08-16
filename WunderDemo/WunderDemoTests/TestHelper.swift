//
//  TestHelper.swift
//  WunderDemoTests
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import ObjectMapper

@testable import WunderDemo
class TestHelper{
    
    func getPlacemarkResponseMock() -> PlacemarkResponse?{
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "locations", ofType: "json")
        let pathUrl = "file://" + path!
        do {
            let jsonData = try Data(contentsOf: NSURL.init(string: pathUrl)! as URL, options: .alwaysMapped)
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else {
                return nil
            }
            return  Mapper<PlacemarkResponse>().map(JSON: json as! [String : Any])
            
        }catch(let error){
            print (error.localizedDescription)
        }
        return nil
    }
}

