class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)

        var length = 0
        var current = head

        // First pass: determine the total number of nodes.
        while current != nil {
            length += 1
            current = current?.next
        }

        var previous: ListNode? = dummy

        // Second pass: stop immediately before the node to remove.
        for _ in 0..<(length - n) {
            previous = previous?.next
        }

        previous?.next = previous?.next?.next

        return dummy.next
    }
}
