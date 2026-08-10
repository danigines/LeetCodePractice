class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // A dummy node simplifies building the result without special-casing the head.
        let dummyHead = ListNode(0)
        var currentResult = dummyHead

        var firstNode = l1
        var secondNode = l2
        var carry = 0

        // Continue while digits remain or a final carry still needs to be added.
        while firstNode != nil || secondNode != nil || carry > 0 {
            let firstValue = firstNode?.val ?? 0
            let secondValue = secondNode?.val ?? 0
            let sum = firstValue + secondValue + carry

            // Keep the current digit and carry the tens value to the next position.
            carry = sum / 10
            currentResult.next = ListNode(sum % 10)

            currentResult = currentResult.next!
            firstNode = firstNode?.next
            secondNode = secondNode?.next
        }

        return dummyHead.next
    }
}
