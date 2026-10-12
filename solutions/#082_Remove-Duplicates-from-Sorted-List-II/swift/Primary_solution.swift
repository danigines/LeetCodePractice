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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var lastDistinct: ListNode? = dummy
        var current = head

        while let node = current {
            if node.next?.val == node.val {
                let duplicateValue = node.val

                while current?.val == duplicateValue {
                    current = current?.next
                }

                lastDistinct?.next = current
            } else {
                lastDistinct = node
                current = node.next
            }
        }

        return dummy.next
    }
}
