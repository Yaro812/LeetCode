//: Playground - noun: a place where people can play

import Foundation


public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
    var array: [Int] {
        var result: [Int] = [val]
        var current = self
        while let next = current.next {
            result.append(next.val)
            current = next
        }
        return result
    }

    static func from(array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }

        let result = ListNode(array[0])
        var current = result
        for i in 1..<array.count {
            let newNode = ListNode(array[i])
            current.next = newNode
            current = newNode
        }
        return result
    }
  }

class Solution {
    func addTwoNumbers_1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        var result: ListNode?
        var current: ListNode?
        var overflow: Int = 0
        while n1 != nil || n2 != nil {
            let v1 = n1?.val ?? 0
            let v2 = n2?.val ?? 0
            let sum = v1 + v2 + overflow
            let newNode = ListNode(sum % 10)
            overflow = sum / 10
            if result == nil {
                result = newNode
                current = newNode
            } else {
                current?.next = newNode
                current = newNode
            }
            n1 = n1?.next
            n2 = n2?.next
        }
        if overflow > 0 {
            current?.next = ListNode(overflow)
        }
        return result
    }

    func addTwoNumbers_final(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        let result = ListNode(0)
        var current = result
        var overflow: Int = 0
        while n1 != nil || n2 != nil {
            let v1 = n1?.val ?? 0
            let v2 = n2?.val ?? 0
            let sum = v1 + v2 + overflow
            let newNode = ListNode(sum % 10)
            overflow = sum / 10
            current.next = newNode
            current = newNode
            n1 = n1?.next
            n2 = n2?.next
        }
        if overflow > 0 {
            current.next = ListNode(overflow)
        }
        return result.next
    }
}

let sol = Solution()
let l1 = ListNode.from(array: [2, 4, 3])
let l2 = ListNode.from(array: [5, 6, 4])
sol.addTwoNumbers_1(l1, l2)?.array
sol.addTwoNumbers_final(l1, l2)?.array
