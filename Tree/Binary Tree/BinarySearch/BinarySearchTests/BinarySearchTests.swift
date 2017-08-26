//
//  BinarySearchTests.swift
//  BinarySearchTests
//
//  Created by Anil Upadhyay on 26/08/17.
//  Copyright © 2017 Anil Upadhyay. All rights reserved.
//

import XCTest
@testable import BinarySearch
class BinarySearchTests: XCTestCase {
    var searchList = [Int]()
    var binarySearch: BinarySearch?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        for i in 1...500 {
            searchList.append(i)
        }
        binarySearch = BinarySearch()
    }
    func  testEmptyArray() {
        let array = [Int]()
        let index = binarySearch?.binarySearch(array, key: 123)
        XCTAssertNil(index)
    }
    func testBinarySearch() {
        for i  in 1...100 {
            var array = [Int]()
            for number in 1...i {
                array.append(number)
            }
            let randomIndex = Int(arc4random_uniform(UInt32(i)))
            let testValue = array[randomIndex]
            let index = binarySearch?.binarySearch(array, key: testValue)
            XCTAssertNotNil(index)
            XCTAssertEqual(index!, randomIndex)
            XCTAssertEqual(array[index!], testValue)
        }
    }
    func testLowerBound() {
        let index = binarySearch?.binarySearch(searchList, key: 1)
        XCTAssertNotNil(index)
        XCTAssertEqual(index!, 0)
        XCTAssertEqual(searchList[index!], 1)
    }
    func testUpperBound() {
        let index = binarySearch?.binarySearch(searchList, key: 500)
        XCTAssertNotNil(index)
        XCTAssertEqual(index!, 499)
        XCTAssertEqual(searchList[index!], 500)
    }
    func testOutOfLowerBound() {
        let index = binarySearch?.binarySearch(searchList, key: 0)
        XCTAssertNil(index)
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
