import Cocoa

/*
 题目五：输入一个链表的头结点，从尾到头反过来打印出每个结点的值。

 解题思路：链表的打印肯定需要遍历链表，反序打印，意味考虑到最先遍历的最后打印，这就可以联想到栈的特性——先进后出。
         于是就很自然地想到利用递归来实现。

 */

class ListNode {
    let value: Int
    var next: ListNode?

    init(_ value: Int) {
        self.value = value
    }
}


class Solution {
    func reverserPrint(node: ListNode?) {
        if node != nil {
            if node?.next != nil {
                reverserPrint(node: node?.next)
            }
            print(node!.value)
        }
    }
}

let head = ListNode(5)
head.next = ListNode(4)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(2)
head.next?.next?.next?.next = ListNode(1)

Solution().reverserPrint(node: head)



