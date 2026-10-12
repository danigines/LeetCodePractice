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

        if head.next?.val == head.val {
            let duplicateValue = head.val
            var current: ListNode? = head

            while current?.val == duplicateValue {
                current = current?.next
            }

            return deleteDuplicates(current)
        }

        head.next = deleteDuplicates(head.next)
        return head
    }
}
