## Explanation [_Optimal solution_]

We traverse the linked list and swap adjacent nodes by changing their `next` references.

For:

```text
1 → 2 → 3 → 4
```

the first pair changes from:

```text
previous → 1 → 2 → 3
```

to:

```text
previous → 2 → 1 → 3
```

The node values never change; only the links between nodes are updated.

### Why use a Dummy Node?

The head changes when the first pair is swapped. A dummy node gives us a stable node before the head:

``` swift
let dummy = ListNode(0, head)
```

This lets every pair use exactly the same reconnection logic, including the first one.

### How is one pair swapped?

We keep three references:

```text
previous → node before the pair
first    → first node in the pair
second   → second node in the pair
```

Then we reconnect them in this order:

``` swift
previous.next = second
first.next = second.next
second.next = first
```

Afterward, `first` is the final node of the swapped pair, so it becomes `previous` for the next iteration.

### What happens with an odd number of nodes?

The loop requires both `first` and `second` to exist. If only one node remains, it has no partner and stays unchanged.

```text
1 → 2 → 3

becomes

2 → 1 → 3
```

### How to Recognize This Pattern

Think of **Linked List Rewiring** when:

- nodes must be reordered without changing their values
- the head may change
- only a small group of adjacent nodes changes at each step
- a dummy node can simplify the first operation

Drawing the references before changing them helps prevent losing the remainder of the list.

## Explanation [_Second solution_]

The recursive solution treats the first two nodes as one pair and delegates the rest of the list to another call.

For:

```text
1 → 2 → 3 → 4
```

we first solve:

```text
swapPairs(3 → 4)
```

which returns:

```text
4 → 3
```

Then the first pair is connected in front of that result:

```text
2 → 1 → 4 → 3
```

### Base Case

If the list has zero or one node, there is no complete pair to swap:

``` swift
guard let first = head,
      let second = first.next else {
    return head
}
```

### What changes compared to the optimal solution?

Both solutions update the same links and process every node once.

The iterative solution explicitly advances from pair to pair and uses constant auxiliary space. The recursive solution is compact, but every pair adds a call to the call stack.

## Comparing solutions

| Aspect | Optimal solution: Iterative Rewiring | Second solution: Recursion |
|:-------|:------------------------------------:|:--------------------------:|
| Advantages | Constant auxiliary space, explicit control, and no recursion-depth concerns. | Compact code that naturally expresses the repeated pair operation. |
| Disadvantages | Requires carefully reconnecting three references in the correct order. | Uses additional call stack space proportional to the number of pairs. |
| When to use it | When predictable memory usage and production safety are preferred. | When the recursive structure makes the pointer changes easier to understand. |
| Interview recommendation | Preferred because it achieves linear time with constant auxiliary space. | Strong alternative for demonstrating recursive linked-list reasoning. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iterative Rewiring | `O(n)` | `O(1)` | `n` is the number of nodes. Each node is visited once, and only a fixed number of references are maintained. |
| Recursion | `O(n)` | `O(n)` | `n` is the number of nodes. Each node is processed once, while approximately `n / 2` recursive calls remain on the call stack. |
