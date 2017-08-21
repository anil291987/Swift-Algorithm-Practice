//: Playground - noun: a place where people can play

import UIKit

//     100
//    /   \
//   20    500
//  /      /  \
// 5      10   600

class Node {
    let value: Int
    let leftChild: Node?
    let rightChild: Node?
    init(value:Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let Node5 = Node(value: 5, leftChild: nil, rightChild: nil)
let Node20 = Node(value: 20, leftChild: Node5, rightChild: nil)
let Node10 = Node(value: 10, leftChild: nil, rightChild: nil)
let Node600 = Node(value: 600, leftChild: nil, rightChild: nil)

let Node500 = Node(value: 500, leftChild: Node10, rightChild: Node600)


let RootNode100 = Node(value: 100, leftChild: Node20, rightChild: Node500)

func search(node:Node?, serachValue:Int)-> Bool {
    if node == nil {
        return false
    }

    if node?.value == serachValue {
        return true
    }else if serachValue < node!.value{
        return search(node: node?.leftChild, serachValue: serachValue)
    }else{
        return search(node: node?.rightChild, serachValue: serachValue)
    }
}
search(node: RootNode100, serachValue: 30)

//efficiency 
let list = [5,20,100,10,500,600]
let index = list.index(where: {$0 == 600})

