//
//  CardDataApiResourceUnitTest.swift
//  projectSliderCardTests
//
//  Created by Saloni Agarwal on 20/06/21.
//

import XCTest

@testable import projectSliderCard

class CardDataApiResourceUnitTest: XCTestCase {

   
    func  test_getCardData_SuccessReturn_CardData(){
        
        //Arrange
        let URL = NSURL(string: Constant.baseUrl)!
        let expectation = expectation(description: "GET \(URL)")
        
        //ACT
        APIManager.shared.getData { (_ response) in
            XCTAssertTrue((response as Any) is [DataItem])
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5){ error in
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                   }
               }
    }

}
