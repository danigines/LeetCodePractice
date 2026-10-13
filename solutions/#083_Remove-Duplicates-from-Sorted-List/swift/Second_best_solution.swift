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
        guard let head else { return nil }

        head.next = deleteDuplicates(head.next)

        if head.val == head.next?.val {
            return head.next
        }

        return head
    }
}
