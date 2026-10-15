## Explanation [_Optimal solution_]

Build two linked-list partitions while traversing the original list:

- `lowerTail` receives nodes whose value is less than `x`.
- `greaterOrEqualTail` receives nodes whose value is greater than or equal to `x`.

Each node is appended to the tail of its corresponding partition, so the original relative order is preserved within both groups.

``` swift
if node.val < x {
    lowerTail.next = node
    lowerTail = node
} else {
    greaterOrEqualTail.next = node
    greaterOrEqualTail = node
}
```

Detach each node before appending it to prevent old links from connecting the partitions incorrectly. Finally, connect the lower partition to the beginning of the greater-or-equal partition.

Dummy nodes make both partitions safe to build even when one group is empty.

### How to Recognize This Pattern

Consider **Stable Partitioning with Two Dummy Lists** when linked-list nodes must be divided into ordered groups without changing their relative order inside each group.

## Explanation [_Second solution_]

Store references to nodes in two arrays: one for values less than `x` and another for values greater than or equal to `x`.

``` swift
if node.val < x {
    lowerNodes.append(node)
} else {
    greaterOrEqualNodes.append(node)
}
```

Concatenate the arrays and reconnect consecutive node references. Since nodes are appended during a left-to-right traversal, the ordering requirement is preserved.

This approach is straightforward, but the arrays require additional memory proportional to the list length.

## Comparing solutions

| Aspect | Optimal solution: Two Lists | Second solution: Node Arrays |
|:-------|:---------------------------:|:----------------------------:|
| Advantages | Reuses the original nodes with constant auxiliary space. | Makes the final stable ordering explicit and easy to inspect. |
| Disadvantages | Requires correctly terminating and joining both partitions. | Allocates arrays for every node reference. |
| When to use it | When an in-place linked-list solution is required. | When clarity is preferred and linear auxiliary space is acceptable. |
| Interview recommendation | Preferred because it demonstrates pointer manipulation and stable partitioning efficiently. | Useful as a simple baseline before optimizing the extra space. |

## Complexity comparison

Let `n` be the number of nodes in the linked list.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Lists | `O(n)` | `O(1)` | Each of the `n` nodes is visited once, and only fixed node references plus two dummy nodes are stored. |
| Node Arrays | `O(n)` | `O(n)` | The list and combined node sequence are processed linearly, while arrays retain references to all `n` nodes. |
