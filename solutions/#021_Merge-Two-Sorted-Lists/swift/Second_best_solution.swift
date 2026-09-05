/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // If one list is exhausted, the other list is already the correct remainder.
        guard let first = list1 else {
            return list2
        }

        guard let second = list2 else {
            return list1
        }

        // Choose the smaller head and recursively merge the remaining nodes.
        if first.val <= second.val {
            first.next = mergeTwoLists(first.next, second)
            return first
        } else {
            second.next = mergeTwoLists(first, second.next)
            return second
        }
    }
}
