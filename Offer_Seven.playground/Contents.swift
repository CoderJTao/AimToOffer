import Cocoa

/*
 题目七：输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。
 
 
 可以在我的一篇文章中看到二叉树的推导分析 （https://coderjtao.github.io/2018/04/18/数据结构：二叉树/）
 */

class BinaryTreeNode {
    let value: String

    var leftNode: BinaryTreeNode?
    var rightNode: BinaryTreeNode?

    init(_ value: String) {
        self.value = value
    }
}

let arr = ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"]
var index = 0

func preCreateTree(_ tree: inout BinaryTreeNode?) {
    if index > arr.count-1 {
        return
    }
    
    let value = arr[index]
    
    index += 1
    
    if value == "#" {
        tree = nil
    } else {
        // 生成根结点
        tree = BinaryTreeNode(value)
        
        // 构造左子树
        preCreateTree(&tree!.leftNode)
        
        // 构造右子树
        preCreateTree(&tree!.rightNode)
    }
}

func preOrderTraverse(_ tree: BinaryTreeNode?) {
    if let node = tree {
        print("value is \(node.value)")
        
        // 先序遍历左子树
        preOrderTraverse(node.leftNode)
        
        // 再先序遍历右子树
        preOrderTraverse(node.rightNode)
    }
}

func inOrdertraverse(_ tree: BinaryTreeNode?) {
    if let node = tree {
        // 中序遍历左子树
        inOrdertraverse(node.leftNode)
        
        print("value is \(node.value)")
        
        // 中序遍历右子树
        inOrdertraverse(node.rightNode)
    }
}

var root: BinaryTreeNode? = BinaryTreeNode("")

// 前序创建
preCreateTree(&root)

class Solution {
    func rebuildBinaryTree(orderBefore: [String]?, orderMid: [String]?) -> BinaryTreeNode? {
        guard let pre = orderBefore, let mid = orderMid else { return nil }
        guard !pre.isEmpty && !mid.isEmpty else { return nil }
        if pre.count != mid.count { return nil }
        
        // 生成根节点
        let rootNode = BinaryTreeNode(pre.first!)
        
        for (i, value) in mid.enumerated() {
            if rootNode.value == value {
                rootNode.leftNode = rebuildBinaryTree(orderBefore: Array(pre[1..<i+1]),
                                                      orderMid: Array(mid[0 ..< i]))
                rootNode.rightNode = rebuildBinaryTree(orderBefore: Array(pre[i+1 ..< pre.count]),
                                                       orderMid: Array(mid[i+1 ..< mid.count]))
            }
        }
        
        return rootNode
    }
}

let preOrder = ["A", "B", "D", "G", "H", "C", "E", "I", "F"]
let inOrder = ["G", "D", "H", "B", "A", "E", "I", "C", "F"]

let rootNode = Solution().rebuildBinaryTree(orderBefore: preOrder, orderMid: inOrder)

preOrderTraverse(rootNode)
