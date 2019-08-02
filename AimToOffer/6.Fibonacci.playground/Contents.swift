import Cocoa

/*
 题目：求斐波那契数列的第 n 项。


 解析：斐波那契数列f最经典的解法应该是递归，但是递归会存在一个问题——重复计算

       例如：求 f(10) 需要 f(9)、f(8); 求 f(9) 需要 f(8)、f(7)。f(8) 重复计算。

**/

class Solution {

    func testRecursive(target: Int) -> UInt64 {
        if target <= 0 { return UInt64(0) }

        if target == 1 { return UInt64(1) }

        return UInt64(testRecursive(target: target-1) + testRecursive(target: target-2))
    }

    func fibonacci(target: Int) -> UInt64 {
        if target < 0 {
            return UInt64(0)
        } else if target < 2 {
            let result = [0, 1]
            return UInt64(result[target])
        }

        var one = 1
        var two = 0
        var result = 0

        for _ in 2...target {
            result = one + two

            two = one
            one = result
        }

        return UInt64(result)
    }
}


// 可以在 Playground 右侧看到两个函数的执行次数有巨大的差异

Solution().testRecursive(target: 10)

Solution().fibonacci(target: 10)
