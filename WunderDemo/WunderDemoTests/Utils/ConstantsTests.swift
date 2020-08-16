//
//  ConstantsTests.swift
//  WunderDemoTests
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import Quick
import Nimble

@testable import WunderDemo
class ConstantsTests: QuickSpec {
    override func spec() {
        describe("test Constant initialization") {
            
            it("BASE URL must be initialized") {
                let baseURL = API.BASE_URL
                let actualBaseURL = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios/"
                expect(baseURL).to(equal(actualBaseURL))
            }
            
            it("Location endPoint must must be initialized") {
                let actualLocationEndPoint = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios/locations.json"
                let locationEndPoint = APIPath.locations.path
                expect(locationEndPoint).to(equal(actualLocationEndPoint))
            }
            
        }
    }
}

