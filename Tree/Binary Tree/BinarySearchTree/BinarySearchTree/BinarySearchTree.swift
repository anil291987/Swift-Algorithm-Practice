//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Anil Upadhyay on 27/08/17.
//  Copyright © 2017 Anil Upadhyay. All rights reserved.
//

import UIKit

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
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
//MARK: - Adding Items
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
}

//MARK: Deleting Items
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
}
//MARK: - Searching
extension BinarySearchTree {
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
    public func contains(value: T) -> Bool {
        return search(value) != nil
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
}
// MARK: - Traversal
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
}
/*
 Is this binary tree a valid binary search tree?
 */
extension BinarySearchTree {
    public func isBST(minValue: T, maxValue: T) -> Bool{
        if value < minValue || value > maxValue {
            return false
        }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
}
// MARK: - Debugging
extension BinarySearchTree {
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
    public func toArray() -> [T] {
        return map { $0 }
    }
}
