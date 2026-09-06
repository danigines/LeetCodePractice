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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var previous = dummy

        while let first = previous.next,
              let second = first.next {
            // Connect the previous pair to the second node of the current pair.
            previous.next = second
            first.next = second.next
            second.next = first

            // The first node is now the end of the swapped pair.
            previous = first
        }

        return dummy.next
    }
}
