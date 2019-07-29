import Cocoa

/*
 题目：给定一棵二叉树和其中的一个结点，如何找出中序遍历序列的下一个节点？节点定义如下。

 解析：  前序遍历：根结点–>左子树–>右子树。
        中序遍历：左子树–>根结点–>右子树。
        后序遍历：左子树–>右子树–>根结点。
        层序遍历：从上至下一层一层遍历。
 */

class BinaryTreeNode {
    let value: String

    var parentNode: BinaryTreeNode?
    var leftNode: BinaryTreeNode?
    var rightNode: BinaryTreeNode?

    init(_ value: String) {
        self.value = value
    }
}

class Solution {
    func findNextNode(_ node: BinaryTreeNode?) -> BinaryTreeNode? {
        guard let nd = node else {
            return nil
        }

        var next: BinaryTreeNode? = nil

        if nd.rightNode != nil {
            var right = nd.rightNode
            while right?.leftNode != nil {
                right = right?.leftNode
            }
            next = right
        } else if nd.parentNode != nil {
            var current = nd
            var parent = nd.parentNode

            while parent != nil {
                if let pRight = parent?.rightNode {
                    if pRight === current {
                        current = parent!
                        parent = current.parentNode
                    }
                }
            }
            next = parent
        }
        return next
    }
}
