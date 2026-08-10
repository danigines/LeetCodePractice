class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addNodes(l1, l2, carry: 0)
    }

    private func addNodes(
        _ firstNode: ListNode?,
        _ secondNode: ListNode?,
        carry: Int
    ) -> ListNode? {
        // No more digits or carry means the addition is complete.
        guard firstNode != nil || secondNode != nil || carry > 0 else {
            return nil
        }

        let sum = (firstNode?.val ?? 0) + (secondNode?.val ?? 0) + carry

        // Each recursive call processes the next digit position.
        let resultNode = ListNode(sum % 10)
        resultNode.next = addNodes(
            firstNode?.next,
            secondNode?.next,
            carry: sum / 10
        )

        return resultNode
    }
}
