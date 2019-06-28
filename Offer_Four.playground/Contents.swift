import UIKit

/*
 题目四：二维数组中的查找
        在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下的递增排序。
        请完成这样一个函数，输入一个w二维数组和一个目标数字，判断数组中是否含有这个数字。
 
 解题思路：将二维数组展开成矩形，每次从右上角或者左下角的数字开始比对，
         每次比较可以排除一行或者一列，直到查找到数字或者无结果。
 */


class Solution {
    func findNum(arr: [[Int]], target: Int) -> Bool {
        var result = false
        
        if arr.isEmpty {
            return result
        }
        
        guard let first = arr.first, !first.isEmpty else {
            return result
        }
        
        var row = 0
        var column = first.count - 1
        
        while row < arr.count && column >= 0 {
            if arr[row][column] == target {
                result = true
                return true
            } else if arr[row][column] > target {
                column -= 1
            } else {
                row += 1
            }
        }
        return result
    }
}

let arr = [[1, 2,  8,  9],
           [2, 4,  9, 12],
           [4, 7, 10, 13],
           [6, 8, 11, 15]]

let target = 7

Solution().findNum(arr: arr, target: 7)
