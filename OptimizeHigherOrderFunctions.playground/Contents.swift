//: Playground - noun: a place where people can play

import UIKit

let numbers = [1,2,3,4,3,3]
//Filter
let filtered = numbers.filter{ return $0 % 2 == 0}
filtered
var filterArray = [Int]()
for number in numbers {
    if number == 3{
        filterArray.append(number)
    }
}
filterArray
filterArray.append(23232)

// Map
let transformed = [1,2,3,4].map({return $0 * 3})
transformed
var transformArray = [Int]()
for number in [1,2,3,4] {
    transformArray.append(number * 2)
}
transformArray
// Reduce
let sum = [1,2,3,4].reduce(0, {sum, number in  sum + number})
sum
var sumElements = 0
for number in [1,2,3,4] {
    sumElements += number
}
sumElements

