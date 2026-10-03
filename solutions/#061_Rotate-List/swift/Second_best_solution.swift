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

        var length = 1
        var tail = head

        while let next = tail.next {
            tail = next
            length += 1
        }

        let rotation = k % length
        guard rotation > 0 else { return head }

        tail.next = head

        var newTail = head
        for _ in 1..<(length - rotation) {
            newTail = newTail.next!
        }

        let newHead = newTail.next
        newTail.next = nil

        return newHead
    }
}
