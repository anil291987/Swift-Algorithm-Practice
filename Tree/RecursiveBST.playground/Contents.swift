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


/* Binary Search Tree (BST) : A binary serach tree is a special kind of binary tree(a tree in ehich each node has at most two children) that performs insertions and deletions such that the tree is always sorted.
 Valid Binary Search tree :
     ■ Each Child left child is smaller that its parent node and each right element child is greater than its parent node.
 Inserting the node :
     ■ We first need to compare the new value to the root node.
     ■ If the new value is less than root node, we takes left branch, if greater, we takes right branch.
     ■ We work our way down the tree this way unitl we find empty spot where we can insert the new value.
 
 For finding place for node it take O(h) times, where the h is height of the tree.
 
 Searching the tree:
 To find a value in the tree, we perform the same steps as with insertion:
     ■ If the value is less than the current node, then takes left branch.
     ■ If the value is greater that the current node, then takes right branch.
     ■ if the value is equal to current node, we've found it!
 
Searching is fast using the structure of the tree. It runs O(h) time. if you have a well-balanced tree with a million node, it takes about 20 steps to find anything in this tree.
 
 Traversing the tree :
     ■ In-Order(Depth - First) : first look at the left of a node then at the node itself and finally at its right child.
     ■ Pre-Order : first look at the node theb its left and right children.
     ■ Post-Order : first look at left and right children and process the node itself last.
 Deleting nodes:
     ■ After remove node we replace the node with either its biggest child on the left or its smallest child on the right. That way tree is still sorted after the removal.
*/
public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    public var isRoot: Bool {
        return parent == nil
    }
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    public var isRightChild: Bool {
        return parent?.right === self
    }
    public var hasLeftChild: Bool {
        return left != nil
    }
    public var hasRightChild: Bool {
        return right != nil
    }
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    public var hasBothChildren : Bool {
        return hasLeftChild && hasRightChild
    }
    public var count: Int {
        return (left?.count ?? 0 ) + 1 + (right?.count ?? 0)
    }
}

extension BinarySearchTree {
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            }else{
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        }else {
            if let right = right {
                right.insert(value)
            }else{
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }
}
extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
    public func searchRec(value: T) ->BinarySearchTree? {
        if value < self.value {
            return  left?.search(value: value)
        }else if value > self.value {
            return right?.search(value: value)
        }else {
            return self
        }
    }
    public func search(value: T) ->BinarySearchTree? {
        var node: BinarySearchTree? = self
        while case let n? = node {
            if value < n.value {
                node = n.left
            }else if value > n.value {
                node = n.right
            }else {
                return node
            }
        }
        return nil
    }
}
extension BinarySearchTree {
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    public func traversePreOrder(process: (T)-> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}
let tree = BinarySearchTree<Int>(array: [7, 2 , 10, 9, 1 , 5])
print(tree)
tree.search(value: 10)
tree.traverseInOrder{value in print(value) }
//tree.traversePreOrder{value in print(value) }
//tree.traversePostOrder{value in print(value) }

tree.count
extension BinarySearchTree {
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left {
            a += left.map(formula: formula)
        }
        a.append(formula(value))
        if let right = right {
            a += right.map(formula: formula)
        }
        return a
    }
    public func toArray() -> [T] {
        return map { $0 }
    }
}
tree.toArray()
