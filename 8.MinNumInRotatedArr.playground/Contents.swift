import UIKit

/*
 *  题目：旋转数组的最小数字
 *          把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
 *      输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。
 *      例如，数组 [3, 4, 5, 1, 2] 为 [1, 2, 3, 4, 5] 的一个旋转。
 *
 *  解题思路：数组旋转z之后，其实就是两个递增的数组。我们只需要找到后一个递增数组的第一个元素。
        取最小下标 left 及最大下标 right，求最中间的元素其下标为 mid = (left + right) / 2，
        如果 arr[mid] >= arr{left]，代表中间的元素在前一个递增序列中，将mid赋值给left
        如果 arr[mid] <= arr{right]，代表中间的元素在后一个递增序列中，将mid赋值给right
 **/

class Solution {
    func findMinNumInRotatedArr(_ arr: [Int]) -> Int? {
        guard !arr.isEmpty else {
            return nil
        }

        var left = 0
        var right = arr.count - 1
        var mid = left

        while arr[left] >= arr[right] {
            if right - left == 1 {
                mid = right
                break
            }

            mid = (left + right) / 2

            // 如果三个下标的数字相等，就只能顺序查找。
            if arr[left] == arr[right] && arr[left] == arr[mid] {
                var result = arr[left]
                for value in arr {
                    if result > value {
                        result = value
                    }
                }
                return result
            }

            if arr[mid] >= arr[left] {
                left = mid
            } else if arr[mid] <= arr[right] {
                right = mid
            }
        }
        return arr[mid]
    }
}

let arr = [3, 4, 5, 1, 2]
let arr1 = [1, 1, 1, 0, 1]

let minNum1 = Solution().findMinNumInRotatedArr(arr)
let minNum2 = Solution().findMinNumInRotatedArr(arr1)
