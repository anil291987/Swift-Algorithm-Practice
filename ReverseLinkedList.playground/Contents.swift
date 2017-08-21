//: Playground - noun: a place where people can play

import UIKit

// Reverse singular Linked lists
// What is Linked list/
// 1->2->3->nil
class Node{
    var value: Int?
    var next: Node?
    init(value: Int?, next: Node?) {
        self.value = value
        self.next = next
    }
}
let node3 = Node(value: 3, next: nil)
let node2 = Node(value: 2, next: node3)
let headNode = Node(value: 1, next: node2)

func printList(head: Node?){
    var currentNode = head
    print("Printing list out node")
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}
printList(head: headNode)
// 1->2->3->nil
//nil<-3<-2<-1
func reverseList(head: Node?) -> Node?{
    var currentNode = head
    var preNode: Node?
    var nextNode: Node?
    while currentNode != nil {
        nextNode =  currentNode?.next
        currentNode?.next = preNode
        print("\(preNode?.value ?? -1)->\(currentNode?.value ?? -1)->\(nextNode?.value ?? -1)" )
        preNode = currentNode
        
        currentNode = nextNode
    }
    return preNode
}
let myReverseList = reverseList(head: headNode)
printList(head: myReverseList)