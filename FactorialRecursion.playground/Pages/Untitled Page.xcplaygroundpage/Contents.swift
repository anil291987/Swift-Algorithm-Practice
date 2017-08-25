//: Playground - noun: a place where people can play

import UIKit

func factorialOfValue(value: UInt) -> UInt {
    if value == 0 {
        return 1
    }
    var product: UInt = 1
    for i in 1...value {
        product = product * i
    }
    return product
}
func recursiveFactorialValue(value: UInt) -> UInt {
    if value == 0 {
        return 1
    }
    print(value)
    return value * recursiveFactorialValue(value: value - 1)
}
//print(factorialOfValue(value: 5))
recursiveFactorialValue(value: 2)
