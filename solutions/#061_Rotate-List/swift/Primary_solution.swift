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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head, head.next != nil, k > 0 else { return head }

        var length = 0
        var current: ListNode? = head

        while current != nil {
            length += 1
            current = current?.next
        }

        let rotation = k % length
        guard rotation > 0 else { return head }

        var fast: ListNode? = head
        var slow: ListNode? = head

        for _ in 0..<rotation {
            fast = fast?.next
        }

        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }

        let newHead = slow?.next
        slow?.next = nil
        fast?.next = head

        return newHead
    }
}
