import UIKit

/*
 题目三就是 AimtoOffer 的第一题。
 
 题目四：合并两个有序数组
    说明：可以假设num1有足够的空间来保存num2的元素。
 
 思路：双指针法，从后往前遍历。
 
        num1 = [1, 2, 3, 0, 0, 0]
                      p1       p
                                         =>  3 < 6 => num1[p] = 6 并且将p2往前移动一位
        num2 = [2, 5, 6]
                      p2
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        
        var p = m + n - 1
        
        while p1 >= 0 && p2 >= 0 {
            
            print("\(p) === \(p1) === \(p2)")
            
            if nums1[p1] < nums2[p2] {
                nums1[p] = nums2[p2]
                p2 -= 1
            } else {
                nums1[p] = nums1[p1]
                p1 -= 1
            }
            
            p -= 1
        }
        
        nums1.replaceSubrange(Range(NSRange(location: 0, length: nums2[0..<p2+1].count))!, with: nums2[0..<p2+1])
    }
}


var a1 = [0]
var a2 = [1]

Solution().merge(&a1, a1.count - a2.count, a2, a2.count)

a1
a2
