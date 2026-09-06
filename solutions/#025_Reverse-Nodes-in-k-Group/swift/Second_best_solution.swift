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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let groupEnd = kthNode(from: head, k) else {
            return head
        }

        let nextGroup = groupEnd.next
        var previous = reverseKGroup(nextGroup, k)
        var current = head

        // Reverse this complete group in front of the recursively processed suffix.
        while current !== nextGroup {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        return groupEnd
    }

    private func kthNode(from node: ListNode?, _ k: Int) -> ListNode? {
        var current = node

        for _ in 1..<k {
            current = current?.next

            if current == nil {
                return nil
            }
        }

        return current
    }
}
