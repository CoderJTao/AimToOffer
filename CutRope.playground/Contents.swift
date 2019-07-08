import Cocoa

/*
 题目：给一个长度为n的绳子，请把绳子剪成m段（m，n都是整数，n > 1 并且 m > 1），每段绳子的长度记为
        k[0],k[1]...k[m]。请问他们的最大乘积是多少？

 解析：    1. 动态规划
            f(n) = max(f(i) * f(n-i)) i 为剪第一刀时的位置。可以看出这是一个递归的问题。
            但是，递归会导致重复计算，所以我们采用由下而上的顺序计算。
          2. 贪婪算法
            当 n >= 5，我们尽可能多地剪长度为3的绳子，当剩下长度为4时，把绳子剪成长度为2的绳子。
            当 n >= 5 时，3(n - 3) >= 2(n - 2)

    ps：这里贪婪算法的时间复杂度及空间复杂度都优于动态规划，但是并不一定求出的是真正的最优解。（下方代码示例的长度为 50 时）
        这两个算法的思想可以去我的blog中查看: (https://coderjtao.github.io/2018/04/29/算法：常用设计思想/)

 */



class Solution {

    // 动态规划
    func maxLengthByCut(length: Int) -> Int {
        if length < 2 { return 0 }
        if length == 2 { return 1 }
        if length == 3 { return 2 }

        var results = Array(repeating: 0, count: length + 1)
        results[0] = 0
        results[1] = 1
        results[2] = 2
        results[3] = 3

        var maxLength = 0

        for index in 4...length {
            maxLength = 0

            for j in 1...index/2 {
                let temp = results[j] * results[index - j]
                if maxLength < temp {
                    maxLength = temp
                }
                results[index] = maxLength
            }
        }

        print(results)
        maxLength = results[length]

        return maxLength
    }

    // 贪婪算法
    func maxLengthByCut2(length: Int) -> Int {
        if length < 2 { return 0 }
        if length == 2 { return 1 }
        if length == 3 { return 2 }

        // 尽可能多地剪去长度为3的绳子段
        var timesOf3 = length / 3

        // 当绳子最后剩下的长度为4的时候，不能再剪去为3的绳子段
        // 此时z更好的方法是把绳子剪成长度为2的两段
        if length - timesOf3 * 3 == 1 {
            timesOf3 -= 1
        }

        let timesOf2 = (length - timesOf3 * 3) / 2

        let a = powf(3, Float(timesOf3))
        let b = powf(2, Float(timesOf2))

        return Int(a * b)
    }
}

Solution().maxLengthByCut(length: 50)

Solution().maxLengthByCut2(length: 50)
