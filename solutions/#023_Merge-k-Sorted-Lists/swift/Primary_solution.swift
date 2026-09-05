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
    private struct MinHeap {
        private var nodes: [ListNode] = []

        var isEmpty: Bool {
            nodes.isEmpty
        }

        mutating func insert(_ node: ListNode) {
            nodes.append(node)
            heapifyUp(from: nodes.count - 1)
        }

        mutating func removeMinimum() -> ListNode? {
            guard !nodes.isEmpty else {
                return nil
            }

            if nodes.count == 1 {
                return nodes.removeLast()
            }

            let minimum = nodes[0]
            nodes[0] = nodes.removeLast()
            heapifyDown(from: 0)
            return minimum
        }

        private mutating func heapifyUp(from index: Int) {
            var child = index

            while child > 0 {
                let parent = (child - 1) / 2

                guard nodes[child].val < nodes[parent].val else {
                    return
                }

                nodes.swapAt(child, parent)
                child = parent
            }
        }

        private mutating func heapifyDown(from index: Int) {
            var parent = index

            while true {
                let leftChild = parent * 2 + 1
                let rightChild = leftChild + 1
                var smallest = parent

                if leftChild < nodes.count,
                   nodes[leftChild].val < nodes[smallest].val {
                    smallest = leftChild
                }

                if rightChild < nodes.count,
                   nodes[rightChild].val < nodes[smallest].val {
                    smallest = rightChild
                }

                guard smallest != parent else {
                    return
                }

                nodes.swapAt(parent, smallest)
                parent = smallest
            }
        }
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = MinHeap()

        // Only the current smallest candidate from each list belongs in the heap.
        for head in lists {
            if let head {
                heap.insert(head)
            }
        }

        let dummy = ListNode(0)
        var tail = dummy

        while !heap.isEmpty {
            guard let smallest = heap.removeMinimum() else {
                break
            }

            tail.next = smallest
            tail = smallest

            // Replace the selected node with the next node from the same list.
            if let next = smallest.next {
                heap.insert(next)
            }
        }

        return dummy.next
    }
}
