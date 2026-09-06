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
        let dummy = ListNode(0, head)
        var groupPrevious = dummy

        while let groupEnd = kthNode(after: groupPrevious, k) {
            let nextGroup = groupEnd.next
            let groupStart = groupPrevious.next!

            var previous = nextGroup
            var current: ListNode? = groupStart

            // Reverse the current complete group and connect it to the next group.
            while current !== nextGroup {
                let next = current?.next
                current?.next = previous
                previous = current
                current = next
            }

            groupPrevious.next = groupEnd
            groupPrevious = groupStart
        }

        return dummy.next
    }

    private func kthNode(after node: ListNode?, _ k: Int) -> ListNode? {
        var current = node

        for _ in 0..<k {
            current = current?.next

            if current == nil {
                return nil
            }
        }

        return current
    }
}
