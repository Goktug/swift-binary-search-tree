// Binary Search Tree
// Goktug Gumus
// Created at 06.01.2018

import Foundation

class Node {
  var value: Int!
  var leftChild: Node?
  var rightChild: Node?
  
  init (value: Int, leftChild: Node? = nil, rightChild: Node? = nil) {
    self.value = value
    self.leftChild = leftChild
    self.rightChild = rightChild
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs.value == rhs.value
  }
  
  static func > (lhs: Node, rhs: Node) -> Bool {
    return lhs.value > rhs.value
  }
  
  static func < (lhs: Node, rhs: Node) -> Bool {
    return lhs.value < rhs.value
  }
}

func isValidBST(_ node: Node) -> Bool {
  return isValidNode(node, minValue: Int.min, maxValue: Int.max)
}

func isValidNode(_ node: Node?, minValue: Int, maxValue: Int) -> Bool {
  guard let node = node else { return true }
  
  print("Node: \(node.value) min: \(minValue) max: \(maxValue)")
  print("1: \(node != node.leftChild)")
  print("2: \(node != node.rightChild)")
  print("3: \(node.value > minValue)")
  print("4: \(node.value < maxValue)")
  print("----")
  
  return
    node != node.leftChild &&
    node != node.rightChild &&
    node.value > minValue &&
    node.value < maxValue &&
    isValidNode(node.leftChild, minValue: minValue, maxValue: node.value) &&
    isValidNode(node.rightChild, minValue: node.value, maxValue: maxValue)
}

/* Example Binary Search Tree
      8
    /   \
   3     10
  / \      \
 1   6      14
    / \     /
   4   7   13
*/

// Create Binary Search Tree
// Returns root node
func createExampleBinarySearchTree() -> Node {
  let leaf1: Node = Node(value: 1)
  let leaf2: Node = Node(value: 4)
  let leaf3: Node = Node(value: 7)
  let leaf4: Node = Node(value: 13)
  
  let depth2Node1: Node = Node(value: 6, leftChild: leaf2, rightChild: leaf3)
  let depth2Node2: Node = Node(value: 14, leftChild: leaf4)
  
  let depth1Node1: Node = Node(value: 3, leftChild: leaf1, rightChild: depth2Node1)
  let depth1Node2: Node = Node(value: 10, rightChild: depth2Node2)
  
  let rootNode: Node = Node(value: 8, leftChild: depth1Node1, rightChild: depth1Node2)
  
  return rootNode
}

let rootNode: Node = createExampleBinarySearchTree()

print("Valid Node: \(isValidBST(rootNode))")


