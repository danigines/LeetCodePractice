## Explanation [_Optimal solution_]

Use a dummy node before `head` so duplicate groups can be removed even when they begin at the first node. Keep two references:

- `lastDistinct` points to the last node confirmed as part of the result.
- `current` examines the next group of values.

Because the list is sorted, equal values are consecutive. When `current` and its next node have the same value, advance `current` past the entire duplicate group and reconnect `lastDistinct.next` to the first different node.

``` swift
if node.next?.val == node.val {
    let duplicateValue = node.val

    while current?.val == duplicateValue {
        current = current?.next
    }

    lastDistinct?.next = current
}
```

When the next value is different, the current node is distinct and both references can advance.

### How to Recognize This Pattern

Consider **Two Pointers with a Dummy Node** when nodes must be removed from a linked list, including a possible run at the head, and the retained tail must reconnect to a later node.

## Explanation [_Second solution_]

Use recursion to solve the remaining suffix of the list.

If `head` starts a duplicate group, skip every node with that value and recursively process the first different node. This removes the complete group rather than keeping one copy.

``` swift
if head.next?.val == head.val {
    let duplicateValue = head.val
    var current: ListNode? = head

    while current?.val == duplicateValue {
        current = current?.next
    }

    return deleteDuplicates(current)
}
```

Otherwise, `head` is distinct. Keep it and attach the recursively cleaned suffix to `head.next`.

## Comparing solutions

| Aspect | Optimal solution: Two Pointers | Second solution: Recursion |
|:-------|:------------------------------:|:--------------------------:|
| Advantages | Uses constant auxiliary space and handles removals at the head uniformly. | Expresses the solution naturally in terms of a cleaned suffix. |
| Disadvantages | Requires carefully maintaining the last retained node. | Uses call-stack space and may be less suitable for very long lists. |
| When to use it | When an in-place, constant-space linked-list solution is preferred. | When a recursive linked-list transformation is easier to explain. |
| Interview recommendation | Preferred because it demonstrates pointer reconnection explicitly and avoids recursion overhead. | Useful as a concise alternative after explaining the base and duplicate cases. |

## Complexity comparison

Let `n` be the number of nodes in the linked list.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Pointers | `O(n)` | `O(1)` | Each of the `n` nodes is examined at most a constant number of times, and only fixed node references plus one dummy node are used. |
| Recursion | `O(n)` | `O(n)` | Each node belongs to one processed group, while up to `n` recursive calls may remain on the call stack. |
