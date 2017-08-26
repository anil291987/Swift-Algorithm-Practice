//: Playground - noun: a place where people can play

import UIKit
#if swift(>=4.0)
    print("Hello, Swift 4!")
#endif
/*
  A general-purpose binary tree.
 Node don't have a reference to their parent.
 */

/* Binary Tree :
     A binary tree is tree where each node has 0,1 or 2 children.
     ■ The child node usually called the left child and right child.
     ■ If a node does't has any node it's called leaf node.
     ■ The root node is the node at the top of tree.(trees like upside down.)
     ■ Often nodes will have a link back to their parent but this is not strictly necessary.
 Binary trees are often used as Binary search tree. In that case node must be in a specific order(smaller value on the left, larger value on the right).
 
 (5 * (a - 10)) + (-4 * (3 / b))
 */
public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
}
//leaf Node
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "B", .empty)

//intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

//intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let ThrreDivideByB = BinaryTree.node(node3 , "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", ThrreDivideByB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}
print("Tree : \(tree)\nTree Count: \(tree.count)")
/* Tree Traversing:
 ■ In-Order(or Depth first): First look at the left child of a node, then at the node itself, and finally at its right child.
 ■ Pre-order: First look at a node, then at its left and right children.
 ■ Post-order: First look at the left and right children and process the node itself.
 */
extension BinaryTree {
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    public func traversePreOrder(process: (T) -> Void){
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    public func traversePostOrder(process: (T) -> Void){
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}
//tree.traverseInOrder { (s) in
//    print(s)
//}
//tree.traversePreOrder { (s) in
//    print(s)
//}
tree.traversePostOrder { (s) in
    print(s)
}
extension BinaryTree {
    func invert() -> BinaryTree {
        if case let .node(left, value, right) = self {
            return .node(right.invert(), value, left.invert())
        }else {
            return .empty
        }
    }
}
tree.invert()
print(tree)
