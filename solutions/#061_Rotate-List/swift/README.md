## Explanation [_Optimal solution_]

First count the `n` nodes and reduce the rotation to `k % n`. Rotating by the list length returns the same list, so only the remainder matters.

Move `fast` ahead by the effective rotation, then advance `fast` and `slow` together until `fast` reaches the original tail:

``` text
1 → 2 → 3 → 4 → 5, k = 2
        slow      fast
```

At that point, `slow.next` is the new head. Break the list after `slow`, then connect the original tail to the original head.

``` swift
let newHead = slow.next
slow.next = nil
fast.next = head
```

The gap between the pointers places `slow` exactly before the final `k` nodes.

### How to Recognize This Pattern

Consider **Two Pointers with a Fixed Gap** when a linked-list operation depends on a position measured from the end rather than from the beginning.

## Explanation [_Second solution_]

After finding the length and original tail, connect the tail to the head to form a temporary circle. The new tail is `n - (k % n)` steps from the original head.

``` text
1 → 2 → 3 → 4 → 5 ┐
↑                   │
└───────────────────┘
```

Walk to the new tail, save its next node as the new head, and set `newTail.next` to `nil` to break the circle. This solution has the same complexity but emphasizes the rotation as choosing a different cut in a circular sequence.

## Comparing solutions

| Aspect | Optimal solution: Two Pointers | Second solution: Circular List |
|:-------|:------------------------------:|:------------------------------:|
| Advantages | Locates the split with a clear fixed gap. | Models rotation naturally as moving the list's cut point. |
| Disadvantages | Requires coordinating two references after a length pass. | Temporarily creates a cycle that must always be broken. |
| When to use it | When practicing positions relative to a linked-list tail. | When circular reconnection makes the transformation clearer. |
| Interview recommendation | Preferred because it directly demonstrates the Two Pointers topic. | An equally efficient and concise alternative. |

## Complexity comparison

Let `n` be the number of nodes in the linked list.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Pointers | `O(n)` | `O(1)` | The length pass and pointer scan each visit at most `n` nodes, while only fixed node references are stored. |
| Circular List | `O(n)` | `O(1)` | Finding the tail and then locating the new cut visits a linear number of nodes and uses only fixed references. |
