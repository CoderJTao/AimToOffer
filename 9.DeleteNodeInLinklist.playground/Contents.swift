import UIKit
/*
 题目：在 O(1)时间内删除链表节点。
 给定单向链表的头指针和一个节点指针，定义一个函数在O(1)时间内删除该节点。
 
 思路：看到这个题目时，第一反应就是遍历链表，查找到要删除的节点，将该节点的上一个节点指向其下一节点，
 并将其删除，但是这个方案的时间复杂度就是O(n)了。
 
 但是，我们并不一定非要找到删除节点的上一个节点。我们只需要将待删除的节点的下一个节点的值赋值给
 待删除节点，并将下一个节点删除即可。
 
 这里我们还需要考虑一些临界情况：
 1. 待删除节点为尾结点，依旧需要顺序遍历删除。
 2. 如果链表只有一个节点，那么我们需要删除节点之后，并将头节点设为nil。
 */

class ListNode {
    var value: Int?
    var next: ListNode?
    
    init(_ val: Int?) {
        self.value = val
    }
}

class Solution {
    // 顺序打印链表供调试
    func printSelf(node: ListNode?) {
        guard let head = node else {
            return
        }
        
        var temp: ListNode? = head
        while temp != nil {
            print(temp!.value)
            temp = temp!.next
        }
    }
    
    func deleteNode(headNode: inout ListNode?,  targetNode: inout ListNode?) {
        guard let head = headNode, let target = targetNode else {
            return
        }
        
        // 要删除的节点不是尾结点
        if target.next != nil {
            print("1")
            
            let next = target.next
            target.value = next?.value
            target.next = next?.next
            
            target.next = nil
        }
            
        // 链表只有一个节点
        else if head.next === target {
            print("2")
            
            targetNode = nil
            
            headNode?.next = nil
        }
            
        // 链表有多个节点，删除尾结点
        else {
            print("3")
            
            var temp: ListNode? = head
            
            while temp?.next !== target {
                temp = temp?.next
            }
            temp?.next = nil
            targetNode = nil
        }
        
        printSelf(node: headNode)
    }
}


var head: ListNode? = ListNode(nil)
var first: ListNode? = ListNode(1)
var target: ListNode? = ListNode(2)
var final: ListNode? = ListNode(3)

/*
 第一种情况
 */
head?.next = first
first?.next = target
target?.next = final
Solution().deleteNode(headNode: &head, targetNode: &target)

/*
 第三种情况
 */
//head?.next = first
//first?.next = nil
//Solution().deleteNode(headNode: &head, targetNode: &first)

/*
 第三种情况
 */
//head?.next = first
//first?.next = target
//Solution().deleteNode(headNode: &head, targetNode: &target)


