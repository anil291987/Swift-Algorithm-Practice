//
//  BinarySearchTreeTests.swift
//  BinarySearchTreeTests
//
//  Created by Anil Upadhyay on 26/08/17.
//  Copyright © 2017 Anil Upadhyay. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class BinarySearchTreeTests: XCTestCase {
    func testRootNode() {
        let tree  = BinarySearchTree(value: 8)
        XCTAssertEqual(tree.count, 1)
        XCTAssertEqual(tree.minimum().value, 8)
        XCTAssertEqual(tree.maximum().value, 8)
        XCTAssertEqual(tree.height(), 0)
        XCTAssertEqual(tree.depth(), 0)
        XCTAssertEqual(tree.toArray(), [8])
    }
    func testCreateFromArray() {
        let tree = BinarySearchTree(array: [8,5,2,3,4,34,25,15])
        XCTAssertEqual(tree.count, 8)
        XCTAssertEqual(tree.toArray(), [2,3,4,5,8,15,25,34])
        
        XCTAssertEqual(tree.search(9)?.value, nil)
        XCTAssertEqual(tree.search(5)?.value, 5)
        XCTAssertNil(tree.search(99))
        
    }
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
