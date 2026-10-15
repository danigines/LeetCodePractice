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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let lowerDummy = ListNode()
        let greaterOrEqualDummy = ListNode()
        var lowerTail = lowerDummy
        var greaterOrEqualTail = greaterOrEqualDummy
        var current = head

        while let node = current {
            current = node.next
            node.next = nil

            if node.val < x {
                lowerTail.next = node
                lowerTail = node
            } else {
                greaterOrEqualTail.next = node
                greaterOrEqualTail = node
            }
        }

        lowerTail.next = greaterOrEqualDummy.next
        return lowerDummy.next
    }
}
