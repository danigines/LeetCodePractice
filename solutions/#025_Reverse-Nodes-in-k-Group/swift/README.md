## Explanation [_Optimal solution_]

We process the linked list in groups of exactly `k` nodes and reverse each complete group in place.

For:

```text
1 → 2 → 3 → 4 → 5
k = 3
```

the first complete group is:

```text
1 → 2 → 3
```

After reversing it:

```text
3 → 2 → 1 → 4 → 5
```

The remaining two nodes stay unchanged because they do not form a complete group of three.

### Why find the kth node first?

Before modifying any references, we verify that the current group contains `k` nodes.

``` swift
while let groupEnd = kthNode(after: groupPrevious, k)
```

If the kth node does not exist, the remaining nodes must stay in their original order and the algorithm stops.

### Why use a Dummy Node?

Reversing the first group changes the list head. A dummy node gives every group a stable predecessor:

``` swift
let dummy = ListNode(0, head)
```

After reversing a group, `groupPrevious.next` can always be connected to the new group head.

### How is one group reversed?

We save the first node after the group:

``` swift
let nextGroup = groupEnd.next
```

Then `previous` begins at `nextGroup`. This makes the old group start connect directly to the following group during the same reversal loop.

```text
Before: previous → 1 → 2 → 3 → nextGroup
After:  previous → 3 → 2 → 1 → nextGroup
```

The old group start becomes the final node of the reversed group and the predecessor for the next iteration.

### Why is the extra space constant?

The algorithm reuses the existing nodes and only maintains a fixed set of references:

```text
groupPrevious
groupEnd
groupStart
nextGroup
previous
current
```

The number of references does not grow with the input size, satisfying the follow-up requirement.

### How to Recognize This Pattern

Think of **In-Place Linked List Reversal** when:

- nodes must be reordered without changing their values
- the operation applies to fixed-size groups
- incomplete trailing groups must remain unchanged
- the list must use constant auxiliary memory

The safest process is:

```text
Validate group → Save boundaries → Reverse → Reconnect
```

## Explanation [_Second solution_]

The recursive solution uses the same group boundaries, but delegates the remaining list to another function call.

For each call:

1. verify that `k` nodes exist
2. save the node after the group
3. recursively process the remaining groups
4. reverse the current group in front of that result

For:

```text
1 → 2 → 3 → 4 → 5
k = 2
```

the calls process the list from the final complete group back toward the first:

```text
swap 3 → 4
then swap 1 → 2
```

producing:

```text
2 → 1 → 4 → 3 → 5
```

### Base Case

If fewer than `k` nodes remain, `kthNode` returns `nil` and that suffix is returned unchanged:

``` swift
guard let groupEnd = kthNode(from: head, k) else {
    return head
}
```

### What changes compared to the optimal solution?

Both solutions reverse the same nodes and run in linear time.

The iterative solution uses constant auxiliary space. The recursive solution keeps one stack frame for every complete group, making it less suitable for large lists or small values of `k`.

## Comparing solutions

| Aspect | Optimal solution: Iterative In-Place | Second solution: Recursion |
|:-------|:------------------------------------:|:--------------------------:|
| Advantages | Constant auxiliary space, explicit group boundaries, and no recursion-depth risk. | Compact structure that naturally connects each reversed group to the processed suffix. |
| Disadvantages | Requires careful tracking and reconnection of several references. | Uses call stack memory proportional to the number of complete groups. |
| When to use it | When constant extra memory and predictable behavior are required. | When recursion makes the group structure easier to express and input size is safely bounded. |
| Interview recommendation | Preferred because it satisfies the `O(1)` extra-memory follow-up. | Strong alternative after presenting the iterative solution. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iterative In-Place | `O(n)` | `O(1)` | `n` is the number of nodes and `k` is the group size. Each node is checked and reversed a constant number of times, while only fixed references are stored. |
| Recursion | `O(n)` | `O(n / k)` | `n` is the number of nodes and `k` is the group size. Every node is processed once, while one stack frame is retained for each complete group. |
