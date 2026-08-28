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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // A dummy node makes removing the original head behave like any other deletion.
        let dummy = ListNode(0, head)

        var fast: ListNode? = dummy
        var slow: ListNode? = dummy

        // Keep fast n + 1 nodes ahead so slow stops before the node to remove.
        for _ in 0...n {
            fast = fast?.next
        }

        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }

        // Skip the target node by reconnecting slow to the following node.
        slow?.next = slow?.next?.next

        return dummy.next
    }
}
