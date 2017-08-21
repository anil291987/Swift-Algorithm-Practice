//: Playground - noun: a place where people can play

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let sentenace = "madam anna kayak notapalindrome anna Civic racecar Civic anna"
       let counts =  allPalindromCount(sentenance: sentenace)
        print("Counts: \(counts)")
    }
    func allPalindromCount(sentenance: String)-> [String: Int] {
        var counts = [String : Int] ()
        let words = sentenance.components(separatedBy: " ")
        words.forEach { (word) in
            if isPalindrome(word: word) {
                let count = counts[word] ?? 0
                counts[word] = count + 1
                print("Found palindrome:", word)
            }
        }
        return counts
    }
    fileprivate func isPalindrome(word: String) -> Bool {
        let characters = Array(word.lowercased())
        var currentIndex  = 0
        while currentIndex < characters.count / 2  {
            if characters[currentIndex] != characters[characters.count - currentIndex - 1]{
                return false
            }
            currentIndex += 1
        }
        return true
    }
}
let viewController = ViewController()
viewController.viewDidLoad()

