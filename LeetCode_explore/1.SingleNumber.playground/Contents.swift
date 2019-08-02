import UIKit

/*
 题目：只出现一次的数字

 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,1]
 输出: 1
 示例 2:

 输入: [4,1,2,1,2]
 输出: 4

 */


/*
 位运算：异或
 规律：      n ^ 0 = n
            n ^ n = 0
 满足交换律： a ^ b ^ c = a ^ c ^ b

 例：数组 arr = [a, a, b, b, c, c, d]
 利用0与所有值异或操作，得到最后的值即为只出现一次的数字

  0 ^ a ^ a ^ b ^ b ^ c ^ c ^ d = 0 ^ (a ^ a) ^ (b ^ b) ^ (c ^ c) ^ d
                                = 0 ^ 0 ^ 0 ^ 0 ^ d
                                = 0 ^ d
                                = d
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for value in nums {
            result ^= value
            print("value = \(value), result = \(result)")
        }
        return result
    }
}

let arr = [2, 2, 3]
Solution().singleNumber(arr)


