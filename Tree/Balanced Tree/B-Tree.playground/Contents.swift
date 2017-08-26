//: Playground - noun: a place where people can play

import UIKit

/* B-Tree :
     A B-Tree is a self-balacing search tree. in which nodes can have more than two children.
 Properties:
 A B-Tree of order n satisfies the following properties:
     ■ Every node has at most 2n keys.
     ■ Every node (except root) has at least n keys.
     ■ Every non-leaf node with k keys has k+1 children.
     ■ The keys in all nodes are sorted in increasing order.
     ■ The subtree between two keys k and l of a non leaf node contains all the keys between k and l.
     ■ All the leaves appear at the same level.
 
*/
class BTreeNode<Key: Comparable, Value> {
    unowned var owner: BTree<key, value>
}
