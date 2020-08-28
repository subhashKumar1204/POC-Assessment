//
//  DashboardViewModelTests.swift
//  POCTests
//
//  Created by Subhash Kumar on 28/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import XCTest
@testable import POC

class DashboardViewModelTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Mock test for Dashboard Expected URL
    func testDashboardExpectedApiURL() {
        
        XCTAssertEqual(Constants.expectedUrlForTest, ServerEndpoints.shared.DashboardFileEndPoint)
    }
    
    //Mock test for Dashboard API success response
    func testDashboardApiOnSuccessReponse() {
        
        let dashboardResponseExpectation = self.expectation(description: "Dashboard API will return the success response")
        
        POCServiceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { result in
            
            switch result {
            case .success(_):
                XCTAssertNotNil(result)
                dashboardResponseExpectation.fulfill()
                break
            case .failure:
                XCTFail(APIError.localizedDescription(.invalidResponse)())
                break
            }
        }
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    //Mock test for Dashboard API success response to return List
    func testDashboardApiOnSuccessReturnsList() {
        
        let dashboardResponseListExpectation = self.expectation(description: "Dashboard API will returns the list of information")
        
        POCServiceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { result in
            
            //on success return list
            if let canadaInformation = result.response {
                if let informationRows = canadaInformation.data?.rows {
                    if informationRows.count > 0 {
                        XCTAssertNotNil(informationRows)
                        dashboardResponseListExpectation.fulfill()
                    }
                }
            }
        }
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    //Mock test for Dashboard API success return Title For NavigationBar
    func testDashboardApiOnSuccessReturnsTitleForNavigationBar() {
        
        let dashboardResponseListExpectation = self.expectation(description: "Dashboard API will return Title For NavigationBar")
        
        POCServiceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { result in
            //on success return list
            if let canadaInformation = result.response {
                let navigationTitle = canadaInformation.data?.title
                if navigationTitle != nil {
                    XCTAssertNotNil(navigationTitle)
                    dashboardResponseListExpectation.fulfill()
                }
            }
        }
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    //Mock test for AboutCanadaModelView
    func testAboutCanadaViewModel() {
        
        let aboutCanada = AboutCanada(title: "Canada", description: "Canada Information", imageUrl: "")
        let canadaViewModel =  AboutCanadaViewModel(canadaInfo: aboutCanada)
        
        //What we want to test
        XCTAssertEqual(aboutCanada.title, canadaViewModel.title)
        XCTAssertEqual(aboutCanada.description, canadaViewModel.description)
        XCTAssertEqual(aboutCanada.imageUrl, canadaViewModel.imageUrl)
        
    }
    
}
