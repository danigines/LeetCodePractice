## Explanation [_Optimal solution_]

Both linked lists are already sorted, so at every step we only need to compare their current nodes.

For:

```text
list1: 1 → 2 → 4
list2: 1 → 3 → 4
```

we repeatedly choose the smaller current value:

```text
1 → 1 → 2 → 3 → 4 → 4
```

### Why use a Dummy Node?

A dummy node lets us build the result without treating the first node as a special case.

``` swift
let dummy = ListNode(0)
```

Conceptually:

```text
dummy → 1 → 1 → 2 → 3 → 4 → 4
```

The dummy value is not part of the actual result, so we return:

``` swift
dummy.next
```

### Why compare only the current nodes?

Because both lists are sorted.

If the current value from `list1` is smaller than the current value from `list2`, then it is also the smallest remaining value available.

We attach that node and advance only `list1`.

The same reasoning applies when the node from `list2` is smaller.

### Why attach the remaining list directly?

When one list becomes empty, the other list is already sorted.

For example:

```text
Result:
1 → 1 → 2 → 3

Remaining:
4 → 4
```

There is nothing left to compare, so we can connect the remainder directly:

``` swift
tail?.next = first ?? second
```

### How to Recognize This Pattern

Think of **Merge Two Sorted Sequences** when:

- you have two already sorted collections
- you need to produce one sorted result
- comparing only the current elements is enough
- after choosing one element, only that source needs to advance

This is the same core operation used during the merge phase of Merge Sort.

## Explanation [_Second solution_]

The recursive solution makes the same comparison, but delegates the remaining work to another function call.

For:

```text
list1: 1 → 2 → 4
list2: 3 → 4
```

the smaller head is:

```text
1
```

Therefore `1` must be the first node of the result.

The remaining problem becomes:

```text
merge(
    2 → 4,
    3 → 4
)
```

Each recursive call solves a smaller version of the same problem.

### Base Cases

If one list is empty:

``` swift
guard let first = list1 else {
    return list2
}
```

the other list can be returned directly because it is already sorted.

### What changes compared to the optimal solution?

The merging decisions are the same.

The difference is how the traversal is managed:

- the iterative solution keeps explicit node references
- the recursive solution uses the call stack

Both require `O(m + n)` time, but recursion also requires `O(m + n)` stack space in the worst case.

## Comparing solutions

| Aspect | Optimal solution: Iterative Merge | Second solution: Recursive Merge |
|:-------|:---------------------------------:|:--------------------------------:|
| Advantages | Linear time, constant auxiliary space, and direct reuse of the existing nodes. | Compact code and a natural recursive representation of a linked list. |
| Disadvantages | Requires explicit references and a dummy node. | Uses additional call stack memory. |
| When to use it | When efficiency, predictable memory usage, and explicit control are preferred. | When recursion provides clearer code and the list depth is safely bounded. |
| Interview recommendation | Preferred solution because it achieves optimal time with constant auxiliary space. | Strong alternative for demonstrating recursive reasoning. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iterative Merge | `O(m + n)` | `O(1)` | `m` is the number of nodes in `list1` and `n` is the number of nodes in `list2`. Each node is processed once and only node references are stored. |
| Recursive Merge | `O(m + n)` | `O(m + n)` | `m` and `n` are the lengths of the two lists. Each node is processed once, while recursive calls remain in the call stack. |
