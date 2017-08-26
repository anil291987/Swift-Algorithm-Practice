//: Playground - noun: a place where people can play

#if swift(>=4.0)
print("Hello, Swift 4!")
#endif
/* Tree:
 A tree represents hierarchical relationship between objects.
 A tree consists of nodes, adn these nodes are linked to one another :
 
 ■ Nodes have linked to theie children and usually with their parants also.
 ■ The children are nodes below a given node.
 ■ The parent is the node above. A node always has just one parent but can have mutiple children.
 ■ The node without parent is called root node.
 ■ A node without children class leaf node.
 ■ The pointers in a tree do not form cycles.
 ■ Basically Tree is realy a very simple form of a Graph.
 
 Definitions of Trees:
 ■ Hight of a Tree :e  This is number of linkes between the root node and thr lowest leaf. IN our example height of tree is 2 because it takes three jumps to go from the root to the bottom.
 ■ Depth of a Node: The number of linkes between current node and the root. For Example the depth of Fruit node is 1 because it takes one jump to reach the root.
 Binary Tree: When Each node have maximum two children it's called Binary tree.
 
 A very common type of tree is Binary search tree, a stricter version of a binary tree where the nodes ara orderd in a particular way to speed up searches.
 
 */
public class TreeNode<T>{
    public var value: T
    
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}
extension TreeNode: CustomStringConvertible {
    public var description: String {
        var treeDescription  = "\(value)"
        if !children.isEmpty {
            treeDescription += " {" + children.map{ $0.description}.joined(separator: ",") + "} "
        }
        return treeDescription
    }
}
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}


let vegeterian = TreeNode<String>(value: "Vegiterian")

let fruitNode = TreeNode<String>(value: "Fruit")

let bananaNode = TreeNode<String>(value: "Banana")
let appleNode = TreeNode<String>(value: "Apple")
let mongoNode = TreeNode<String>(value: "Mongo")

let vegitableNode = TreeNode<String>(value: "Vegitable")

let patatoNode = TreeNode<String>(value: "Potato")
let onionNode = TreeNode<String>(value: "Onion")


vegeterian.addChild(fruitNode)
fruitNode.addChild(bananaNode)
fruitNode.addChild(appleNode)
fruitNode.addChild(mongoNode)

vegeterian.addChild(vegitableNode)
vegitableNode.addChild(patatoNode)
vegitableNode.addChild(onionNode)

print(vegeterian)


let onion = vegeterian.search("Onion")






