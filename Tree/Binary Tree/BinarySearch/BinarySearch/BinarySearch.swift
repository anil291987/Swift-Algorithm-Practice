//
//  BinarySearch.swift
//  BinarySearch
//
//  Created by Anil Upadhyay on 26/08/17.
//  Copyright © 2017 Anil Upadhyay. All rights reserved.
//

import UIKit

public class BinarySearch {
    func binarySearchRecursive<T: Comparable>(_ a:[T], key: T, range: Range<Int>)-> Int? {
        if range.lowerBound >= range.upperBound {
            // If we get here, then the search key is not present in the array.
            return nil
        }else {
            // Calculate where to split the array.
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            // Is the searck key in the left half?
            if a[midIndex] > key {
                return binarySearchRecursive(a, key: key, range: range.lowerBound..<midIndex)
            }
                
                // Is the search Key in the right half?
            else if a[midIndex] < key {
                return binarySearchRecursive(a, key: key, range: midIndex + 1..<range.upperBound)
            }
                // If we get here, then we've found the serach key!
            else{
                return midIndex
            }
        }
    }
    func binarySearch<T: Comparable>(_ a:[T], key: T)-> Int? {
        var lowerBound = 0
        var upperBound = a.count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if a[midIndex] == key {
                return midIndex
            }else if a[midIndex] < key {
                lowerBound = midIndex + 1
            }else{
                upperBound = midIndex
            }
        }
        return nil
    }
}
