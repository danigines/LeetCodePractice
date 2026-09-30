## Explanation [_Optimal solution_]

Track `farthestReach`, the farthest index reachable from every position processed so far. An index can contribute a new jump only if it is already reachable.

``` swift
guard index <= farthestReach else { return false }
farthestReach = max(farthestReach, index + nums[index])
```

If the current index is beyond `farthestReach`, there is a gap that no previous jump can cross. If `farthestReach` reaches the final index, the answer is immediately `true`; the exact sequence of jumps does not need to be constructed.

### How to Recognize This Pattern

Consider **Greedy Reachability** when every valid position expands a reachable interval and only the farthest boundary matters for future choices.

## Explanation [_Second solution_]

Dynamic programming stores whether every index is reachable. Start with index `0` marked as reachable. From each reachable position, mark every destination within its jump range:

``` text
reachable[destination] = true
for every destination in index + 1 ... index + nums[index]
```

This directly explores all possible forward transitions. It is simple to verify, but overlapping jump ranges repeatedly visit the same destinations.

## Comparing solutions

| Aspect | Optimal solution: Greedy Reach | Second solution: Dynamic Programming |
|:-------|:------------------------------:|:------------------------------------:|
| Advantages | One pass with constant auxiliary space and early completion. | Explicitly records reachability for every index. |
| Disadvantages | Requires understanding why only the farthest boundary matters. | Repeats work across overlapping ranges. |
| When to use it | When only final reachability is required. | When deriving the state transitions before optimizing them. |
| Interview recommendation | Preferred; state the reachable-interval invariant clearly. | Useful as a straightforward baseline. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Greedy Reach | `O(n)` | `O(1)` | Each reachable index is inspected at most once, while only the farthest boundary is stored. |
| Dynamic Programming | `O(n²)` | `O(n)` | In the worst case, every reachable index marks a linear number of destinations; the boolean array stores one value per index. |
