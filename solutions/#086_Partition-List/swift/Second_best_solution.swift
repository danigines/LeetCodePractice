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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lowerNodes: [ListNode] = []
        var greaterOrEqualNodes: [ListNode] = []
        var current = head

        while let node = current {
            if node.val < x {
                lowerNodes.append(node)
            } else {
                greaterOrEqualNodes.append(node)
            }

            current = node.next
        }

        let orderedNodes = lowerNodes + greaterOrEqualNodes

        for index in orderedNodes.indices {
            let nextIndex = index + 1
            orderedNodes[index].next = nextIndex < orderedNodes.count
                ? orderedNodes[nextIndex]
                : nil
        }

        return orderedNodes.first
    }
}
