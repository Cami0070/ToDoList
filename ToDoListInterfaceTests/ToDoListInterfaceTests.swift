//
//  ToDoListInterfaceTests.swift
//  ToDoListInterfaceTests
//
//  Created by Camelia Braghes on 30.01.2022.
//

import XCTest
@testable import ToDoListInterface

class ToDoListInterfaceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let manager = TodoListManager.emptyState()
        
        XCTAssertTrue(manager.items.count == 0, "should start with empty list of todo's ")
        
        manager.addItem()
        XCTAssertTrue(manager.items.count == 1, "should have one todo after adding ")
    }

}
