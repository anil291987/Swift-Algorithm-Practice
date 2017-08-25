//: Playground - noun: a place where people can play

import UIKit

func mostCommonNameInArray(_ array: [String]) -> String {
    var namesCountDictionary = [String: Int] ()
    for name in array {
        if let count = namesCountDictionary[name]  {
            namesCountDictionary[name] = count + 1
        }else{
            namesCountDictionary[name] = 1
        }
    }
    var mostCommonName = ""
    for key in namesCountDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        }else {
            let count = namesCountDictionary[key]!
            if count > namesCountDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key): \(namesCountDictionary[key]!)")
    }
    return mostCommonName
}

mostCommonNameInArray(["Bob", "Mark", "tase", "Bob"])
