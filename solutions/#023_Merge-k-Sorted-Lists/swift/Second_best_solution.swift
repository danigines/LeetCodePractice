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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }

        var mergedLists = lists
        var interval = 1

        // Merge neighboring lists in balanced rounds: 1, 2, 4, 8, ...
        while interval < mergedLists.count {
            for index in stride(
                from: 0,
                to: mergedLists.count - interval,
                by: interval * 2
            ) {
                mergedLists[index] = mergeTwoLists(
                    mergedLists[index],
                    mergedLists[index + interval]
                )
            }

            interval *= 2
        }

        return mergedLists[0]
    }

    private func mergeTwoLists(_ firstList: ListNode?, _ secondList: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        var first = firstList
        var second = secondList

        while let firstNode = first, let secondNode = second {
            if firstNode.val <= secondNode.val {
                tail.next = firstNode
                first = firstNode.next
            } else {
                tail.next = secondNode
                second = secondNode.next
            }

            tail = tail.next!
        }

        tail.next = first ?? second
        return dummy.next
    }
}
