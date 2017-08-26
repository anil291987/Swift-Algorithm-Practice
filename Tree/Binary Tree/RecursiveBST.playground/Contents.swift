//: Playground - noun: a place where people can play

import UIKit
#if swift(>=4.0)
    print("Hello, Swift4!")
#endif
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
    public func search(_ value: T) ->BinarySearchTree? {
        if value < self.value {
            return  left?.search(value)
        }else if value > self.value {
            return right?.search(value)
        }else {
            return self
        }
    }
//    public func search(_ value: T) ->BinarySearchTree? {
//        var node: BinarySearchTree? = self
//        while case let n? = node {
//            if value < n.value {
//                node = n.left
//            }else if value > n.value {
//                node = n.right
//            }else {
//                return node
//            }
//        }
//        return nil
//    }
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
var tree = BinarySearchTree<Int>(array: [7, 2 , 10, 9, 1 , 5])
print(tree)
tree.search(10)
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

extension BinarySearchTree {
    private func reconnectParentToNode(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            }else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    public func minimum() -> BinarySearchTree {
        var node = self
        while case let next? = node.left {
            node = next
        }
        return node
    }
    public func maximum() -> BinarySearchTree {
        var node = self
        while case let next? = node.right {
            node = next
        }
        return node
    }
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        //Replacement for current node can be either biggest one on the left or smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        }else if let left = left {
            replacement = left.maximum()
        }else {
            replacement = nil
        }
        
        replacement?.remove()

        // Place the current on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentToNode(node: replacement)
        
        // The current node is no longer part of tree, sp clena it up
        parent = nil
        left  = nil
        right = nil
        
        return replacement
    }
    public func height() -> Int{
        if isLeaf {
            return 0
        }else {
            return 1 + max(left?.height() ?? 0 , right?.height() ?? 0)
        }
    }
    public func depth() -> Int {
        var node = self
        var edges = 0
        while case let parent? = node.parent{
            node = parent
            edges += 1
        }
        return edges
    }
}
tree.height()
tree.depth()
if let node9 = tree.search(9) {
    node9.depth()
}
/* Predecessor and Successor :
     The binary serach tree is always "sorted" but that does not mean that consecutive numbers are actually next to each other in tree.
 
 */
extension BinarySearchTree {
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = left {
            return left.maximum()
        }else{
            var node  = self
            while case let parent? = node.parent {
                if parent.value < value {
                    return parent
                }else{
                    node = parent
                }
            }
            return nil
        }
    }
    public func successor() -> BinarySearchTree<T>?{
        if let right = right {
            return right.minimum()
        }else {
            var node = self
            while case let parent? = node.parent {
                if parent.value > value {
                    return parent
                }else {
                    node = parent
                }
            }
            return nil
        }
    }
    public func isBST(minValue minValue: T, maxValue: T) -> Bool{
        if value < minValue || value > maxValue {
            return false
        }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
}
if let node1 = tree.search(1) {
    node1.insert(100)
    tree.search(100)
    tree.isBST(minValue: Int.min, maxValue: Int.max)
}
// Binary Search Tree Using Enum
public enum BinarySearchTreeCopyType<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(BinarySearchTreeCopyType, T, BinarySearchTreeCopyType)

    public var count: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return left.count + 1 + right.count
        }
    }
    public var height: Int {
        switch self{
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    public func insert(_ newValue: T) -> BinarySearchTreeCopyType {
        switch self {
        case .Empty:
            return .Leaf(newValue)
        case .Leaf(let value):
            if newValue < value {
                return .Node(.Leaf(newValue), value, .Empty)
            }else {
                return .Node(.Empty, value, .Leaf(newValue))
            }
        case .Node(let left, let value, let right):
            if newValue < value {
                return .Node(left.insert(newValue), value, right)
            }else {
                 return .Node(left, value, right.insert(newValue))
            }
        }
    }
    public func search(_ x: T) -> BinarySearchTreeCopyType? {
        switch self {
        case .Empty:
            return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case let .Node(left, y, right):
            if x < y {
                return left.search(x)
            }else if x > y{
                return right.search(x)
            }else {
                return self
            }
        }
    }
}
var treeCopy = BinarySearchTreeCopyType.Leaf(7)
treeCopy = treeCopy.insert(2)
treeCopy = treeCopy.insert(5)
treeCopy = treeCopy.insert(10)
treeCopy = treeCopy.insert(9)
treeCopy = treeCopy.insert(1)

treeCopy.search(10)
treeCopy.search(1)
treeCopy.search(11)

extension BinarySearchTreeCopyType: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty:
            return "."
        case .Leaf(let value):
            return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}
print(treeCopy)

/*
 A binary search tree is balanced when its left and right subtrees contain the same number of nodes. In that case, the height of the tree is log(n), where n is the number of nodes. This is the ideal situation.
 if one branch is significantly longer than the other, searching becomes very slow. We end up checking more values than we used. In the worst case, the height of the tree can become n. Such a tree acts like a linked list than a binary search tree, with perfomance degrading to O(n). Not good!
 Solution:
     ■ One way to make the binary search tree is to insert the nodes in a totally random order. On average that should balance out the tree well, but is not guaranteed, nor is it always practical.
     ■ The other soluion is to use a self-balancing tree. This type of data structure adjusts the tree keep it balanced after you insert or delete nodes. i.e AVL tree, Red-Black tree anf B - tree.
 */
tree = BinarySearchTree<Int>(value: 7)
tree.insert(2)
tree.insert(5)
tree.insert(10)
tree.insert(9)
tree.insert(1)

let toDelete = tree.search(1)
toDelete?.remove()
print(tree)

let tree2 = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])

tree2.search(5)
tree2.search(2)
tree2.search(7)
tree2.search(6)

tree2.traverseInOrder{ value in print(value)}

tree2.toArray()

tree2.maximum()
tree2.minimum()

if let node2 = tree2.search(2) {
    node2.remove()
    node2
    print(tree2)
}
tree2.height()
tree2.predecessor()
tree2.successor()

if let node10 = tree2.search(10) {
    node10.depth()
    node10.height()
    node10.predecessor()
    node10.successor()
}
if let node9 = tree2.search(9) {
    node9.depth()
    node9.height()
    node9.predecessor()
    node9.successor()
}
if let node1 = tree2.search(1) {
    tree2.isBST(minValue: Int.min, maxValue: Int.max)
    node1.insert(100)
    tree2.search(100)
    tree2.isBST(minValue: Int.min, maxValue: Int.max)
}
