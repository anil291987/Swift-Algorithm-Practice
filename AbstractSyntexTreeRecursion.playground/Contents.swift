//: Playground - noun: a place where people can play

import UIKit

//Example 
5 + 25 * 6
//Node that represents a value or operator in Abstract Syntex Tree
class Node {
    var operation: String? //"*", "+", "-", "/"
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
//25 * 6 + 5
// +
// + 5
// 25 6
let node6 = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let node5 = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
let node25 = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)
let multipication25_6Node = Node(operation: "*", value: nil, leftChild: node25, rightChild: node6)

let rootplusNode = Node(operation: "+", value: nil, leftChild: multipication25_6Node, rightChild: node5)


func evaluate(node: Node) -> Float {
    if node.value != nil {
        return node.value!
    }
    if node.operation == "+" {
        //apply recursion
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    }else if node.operation == "*" {
        return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
    }else if node.operation == "-" {
        return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
    }else if node.operation == "/"{
        assert(node.rightChild?.value == 0, "you can't divide by zero")
        return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
    }
    
    
    
    return 0
}
evaluate(node: rootplusNode)
