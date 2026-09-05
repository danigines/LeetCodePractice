## Explanation [_Optimal solution_]

Every input list is already sorted. Therefore, the next node in the final result must be the smallest current head among all non-empty lists.

For:

```text
list 1: 1 → 4 → 5
list 2: 1 → 3 → 4
list 3: 2 → 6
```

the initial candidates are:

```text
1, 1, 2
```

A **Min Heap** lets us retrieve the smallest candidate efficiently.

### How does the Min Heap work here?

Initially, we insert only the head of each non-empty list.

After removing the smallest node, we:

1. attach it to the result
2. advance within the list it came from
3. insert its next node into the heap

For example:

```text
Remove 1 from list 1
Result: 1
Insert 4 from list 1

Heap candidates: 1, 2, 4
```

The heap never needs to contain every node. It stores at most one current candidate from each list.

### Why use a Dummy Node?

The dummy node avoids treating the first result node as a special case:

``` swift
let dummy = ListNode(0)
var tail = dummy
```

Every selected node is attached using the same operation:

``` swift
tail.next = smallest
tail = smallest
```

The actual merged list starts at `dummy.next`.

### Why is this better than scanning every list?

If we searched all `k` current heads for every output node, each selection could cost `O(k)`.

The Min Heap reduces each removal and insertion to `O(log k)`, while keeping the smallest candidate at its root.

### How to Recognize This Pattern

Think of a **Min Heap** when:

- several sorted sources must be merged
- only the smallest current value is needed at each step
- each selected value reveals the next candidate from the same source
- repeatedly scanning every source would be too expensive

This pattern is commonly called a **k-way merge**.

## Explanation [_Second solution_]

The Divide and Conquer solution repeatedly merges lists in balanced pairs.

With four lists:

```text
Round 1:
list 1 + list 2
list 3 + list 4

Round 2:
merged 1-2 + merged 3-4
```

The interval between paired lists doubles after every round:

```text
1 → 2 → 4 → 8 → ...
```

Each pair is merged using the same two-reference technique as problem 21, **Merge Two Sorted Lists**.

### Why merge in balanced rounds?

Sequentially merging the accumulated result with every next list can repeatedly traverse an increasingly large list.

Balanced rounds limit the number of times each node participates in a merge to approximately `log k`.

This is the same organization used by Merge Sort: solve small groups first and combine them into progressively larger sorted groups.

### What changes compared to the optimal solution?

The heap solution chooses one node at a time from up to `k` candidates.

The Divide and Conquer solution merges entire pairs of lists. Both achieve `O(N log k)` time, but the second solution temporarily stores a mutable copy of the array of list heads instead of maintaining a heap.

## Comparing solutions

| Aspect | Optimal solution: Min Heap | Second solution: Divide and Conquer |
|:-------|:--------------------------:|:-----------------------------------:|
| Advantages | Directly models a k-way merge and always exposes the smallest current node. | Reuses the familiar two-list merge and has simple balanced rounds. |
| Disadvantages | Swift has no built-in heap, so the heap implementation must be written manually. | The pair and interval management is less direct than selecting the global minimum. |
| When to use it | When merging multiple sorted sources or processing sorted streams incrementally. | When all lists are available and pairwise merging is convenient. |
| Interview recommendation | Preferred when the interviewer expects a Priority Queue or k-way merge. | Equally optimal alternative that demonstrates Divide and Conquer and Merge Sort reasoning. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Min Heap | `O(N log k)` | `O(k)` | `N` is the total number of nodes across all lists and `k` is the number of input lists. Every node is inserted into and removed from a heap containing at most `k` nodes. |
| Divide and Conquer | `O(N log k)` | `O(k)` | `N` is the total number of nodes and `k` is the number of lists. Every node participates in at most `log k` merge rounds, while the mutable array of list heads contains `k` entries. |
