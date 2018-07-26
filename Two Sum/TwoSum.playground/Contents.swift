
/*:
 ## Two sum

 See on [Leetcode](https://leetcode.com/problems/two-sum/description/)

 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 */
import Foundation

// the best i can make
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashTable: [Int: Int] = [:]
    for idx1 in 0..<nums.count {
        let num = nums[idx1]
        let complement = target - num
        if let idx2 = hashTable[complement] {
            return [idx2, idx1]
        }
        hashTable[num] = idx1
    }
    return []
}

twoSum([2,7,11,15], 9)
