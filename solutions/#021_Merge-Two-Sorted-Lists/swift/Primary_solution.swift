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
        // The dummy node removes the need to handle the result head separately.
        let dummy = ListNode(0)
        var tail: ListNode? = dummy

        var first = list1
        var second = list2

        // Always attach the smaller current node to preserve sorted order.
        while let firstNode = first, let secondNode = second {
            if firstNode.val <= secondNode.val {
                tail?.next = firstNode
                first = firstNode.next
            } else {
                tail?.next = secondNode
                second = secondNode.next
            }

            tail = tail?.next
        }

        // The remaining list is already sorted, so it can be attached directly.
        tail?.next = first ?? second

        return dummy.next
    }
}
