//: Playground - noun: a place where people can play

import UIKit

class Node<T>{
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}
class Stack<T>{
    var top: Node<T>?
    
    func push(_ value: T) {
        var oldTop = top
        top = Node(value: value)
        top?.next = oldTop
    }
    func pop() -> T? {
        var currentPop = top
        top = top?.next
        return currentPop?.value
    }
    func peek() -> T? {
        return top?.value
    }
}



struct User{
    let name    : String
    let userName: String
}
let me = User(name: "Anil", userName: "@anil")
let you = User(name: "Manoj", userName: "@manoj")

let userStack = Stack<User>()
userStack.push(me)
userStack.push(you)
let firstPopO = userStack.pop()
print(firstPopO?.name ?? "")

let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

let firstPop = stack.pop()
stack.peek()
let secondPop = stack.pop()
let thirdPop = stack.pop()
let fourthPop = stack.pop()
