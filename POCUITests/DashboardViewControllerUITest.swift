//
//  DashboardViewControllerUITest.swift
//  POCUITests
//
//  Created by Subhash Kumar on 28/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import XCTest
@testable import POC

class DashboardViewControllerUITest: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    }
    
    func testTableViewInitialization() {
        
        let tableView = app.tables.containing(.table, identifier: "DashboardInfoTableView")
           let cell = tableView.cells.element(matching: .cell, identifier: "InfoTableViewcell")
           let existencePredicate = NSPredicate(format: "exists == 1")
           let expectationEval = expectation(for: existencePredicate, evaluatedWith: cell, handler: nil)
           let testWaiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
           XCTAssert(XCTWaiter.Result.completed == testWaiter, "Test Case Failed.")
    }
    
    
    
    func testInitilizationOfDataSource() {
        
        let tableView = app.tables.containing(.table, identifier: "DashboardInfoTableView")
        let cell = tableView.cells.containing(.cell, identifier: "InfoTableViewcell")
        //checking tableview is created and number of cell is more than Zero or not
        XCTAssertGreaterThan(cell.count, 1)

    }


}
