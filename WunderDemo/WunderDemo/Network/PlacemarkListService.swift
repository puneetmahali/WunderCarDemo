//
//  PlacemarkListService.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import RxSwift
import Alamofire

class PlacemarkListService: BaseMappableNetworkRequest<PlacemarkResponse>{
    
    func getPlacemarkList() -> Observable<PlacemarkResponse>{
        return getResponseObject(url: APIPath.locations.path)
    }
}
