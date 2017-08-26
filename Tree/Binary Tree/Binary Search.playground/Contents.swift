//: Playground - noun: a place where people can play

import UIKit

/* Binary Search:
 Goal: Quickly find an element in an array.
 
*/
let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]
numbers.index(of: 43)

// The built-in indexOf() function performs a linear search.
func linearSearch<T: Equatable>(_ a:[T], _ key: T) -> Int?{
    for i in 0..<a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}
linearSearch(numbers, 43)

/* Divide and Conquer :
 The classic way to speed this up is to use a binary search. The trick is to keep splitting the array in half until the value is found.
 
 For an array of size n, the performance is not O(n) as with linear serach but only O(log n). To put perspective, binary search on an array with 1,000,000 elements only takes about 20 steps to find what you're looking for, because log_2(1,000,000) = 19.9.And for any array with a billion elements it only takes 30 steps.(Then again, when was the last time you used an array wth the billion items?)
 
 DownSide of Binary Search : The array must be sorted.
 How Binary Search Works:
     ■ Split the array in half and determine whether the thing you're looking for, known as the search key, is in the left half or in the right half.
     ■ How do you determine in which half the search key is? This is why you sorted the array first, so you can do a simple < or > comparison.
     ■ If the search key is in the half, you repeat the process there, split the left half into two even smaller pieces and look in which piece the search key is must lie.(Likewise for when it's the right half.)
     ■ This repeat until the search key is found. If the array cannot be split up any further, you must regrettably conclude that the search key is not present in the array.
*/
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

let sortedNumbers = numbers.sorted()
binarySearchRecursive(sortedNumbers, key: 43, range: 0..<sortedNumbers.count)
/* Iterative vs Recursive :
 
 
 */
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
binarySearch(sortedNumbers, key: 43)
