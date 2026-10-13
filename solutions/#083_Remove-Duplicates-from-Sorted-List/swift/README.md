## Explanation [_Optimal solution_]

Traverse the sorted list with `current`. Since equal values are adjacent, compare each node with its next node.

When both values are equal, bypass the next node without advancing `current`. Keeping `current` in place allows it to remove every additional occurrence of the same value.

``` swift
if node.val == next.val {
    node.next = next.next
} else {
    current = next
}
```

When the values differ, the current group is complete and `current` can advance. Unlike problem 82, this exercise keeps the first occurrence of every value, so no dummy node is necessary.

### How to Recognize This Pattern

Consider **In-Place Linked-List Deduplication** when the list is sorted and consecutive equal nodes can be removed by rewiring a single `next` reference.

## Explanation [_Second solution_]

Recursively remove duplicates from the suffix beginning at `head.next`, then attach the cleaned suffix back to `head`.

``` swift
head.next = deleteDuplicates(head.next)

if head.val == head.next?.val {
    return head.next
}
```

If `head` now has the same value as the first node of the cleaned suffix, return the suffix and discard `head`. Otherwise, keep `head`. Processing the suffix first ensures that at most one node remains for each value.

## Comparing solutions

| Aspect | Optimal solution: Iteration | Second solution: Recursion |
|:-------|:---------------------------:|:--------------------------:|
| Advantages | Modifies the links in place with constant auxiliary space. | Expresses the solution concisely as a cleaned suffix. |
| Disadvantages | Must avoid advancing after removing a duplicate. | Uses call-stack space proportional to the list length. |
| When to use it | When constant space and explicit pointer control are preferred. | When recursive linked-list processing is acceptable. |
| Interview recommendation | Preferred because it is direct, efficient, and avoids recursion overhead. | Useful as a compact alternative after explaining why the suffix is processed first. |

## Complexity comparison

Let `n` be the number of nodes in the linked list.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iteration | `O(n)` | `O(1)` | Each of the `n` nodes is examined once, and only one traversal reference is stored. |
| Recursion | `O(n)` | `O(n)` | Each of the `n` nodes is processed once, while up to `n` recursive calls may remain on the call stack. |
