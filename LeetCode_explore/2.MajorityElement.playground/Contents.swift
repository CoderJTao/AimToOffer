import UIKit

/*
    题目：求众数。
        给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 [ n/2 ] 的元素。
        你可以假设数组是非空的，并且给定的数组总是存在众数。

    解析：1. 直接将数组排序，中央的数字肯定是众数。
         2. 维持一个计数器 count 以及一个候选众数 candidate，数组循环，
            碰到相等的数字 count + 1，不相等 count -1。
            当 count 为 0 时，我们忽略掉前方的数字，忽略掉了相同数目的众数和非众数，后续剩余数组中的众数依旧是原数组的众数。
            再将当前循环的数值设为候选人。
 */

class Solution {

    func majorityElement1(_ nums: [Int]) -> Int? {
        guard !nums.isEmpty else {
            return nil
        }

        var arr = nums
        arr.sort()
        return arr[arr.count / 2]
    }

    func majorityElement2(_ nums: [Int]) -> Int? {
        guard !nums.isEmpty else {
            return nil
        }

        var count = 0
        var candidate: Int?

        for value in nums {
            if count == 0 {
                candidate = value
            }

            if value == candidate {
                count += 1
            } else {
                count -= 1
            }
        }

        return candidate
    }
}

