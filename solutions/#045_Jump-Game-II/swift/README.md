## Explanation [_Optimal solution_]

Treat every jump as one level of reachable indices. `currentBoundary` marks the end of the range reachable with the current number of jumps, while `farthestReach` records the farthest index reachable from every position inside that range.

``` swift
farthestReach = max(farthestReach, index + nums[index])

if index == currentBoundary {
    jumps += 1
    currentBoundary = farthestReach
}
```

When the scan reaches `currentBoundary`, every possible launch point for that jump has been examined. Advancing the boundary to `farthestReach` therefore gives the widest possible next level and uses one more jump.

We stop scanning before the last index because reaching it completes the task; counting another boundary there would add an unnecessary jump.

``` text
nums = [2, 3, 1, 1, 4]

jump 0: indices [0]       → farthest reach 2
jump 1: indices [1...2]   → farthest reach 4
jump 2: last index reached
```

### How to Recognize This Pattern

Consider **Greedy Range Expansion** when one move reaches an interval of positions and scanning the entire current interval reveals the farthest boundary for the next move. This is equivalent to breadth-first search without storing a queue.

## Explanation [_Second solution_]

Dynamic programming stores the minimum jumps required to reach every index. Starting from each reachable position, update all destinations within its jump range:

``` text
dp[destination] = min(dp[destination], dp[index] + 1)
```

This directly models all possible jumps and is easy to verify, but overlapping ranges cause many destinations to be revisited.

## Comparing solutions

| Aspect | Optimal solution: Greedy Ranges | Second solution: Dynamic Programming |
|:-------|:-------------------------------:|:------------------------------------:|
| Advantages | One pass and constant auxiliary space. | Explicitly records the best result for every index. |
| Disadvantages | The range-level invariant requires explanation. | Repeats work across overlapping jump ranges. |
| When to use it | When only the minimum number of jumps is needed. | When learning the state transition before optimizing it. |
| Interview recommendation | Preferred; relate each boundary to one BFS level. | Useful as a clear baseline solution. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Greedy Ranges | `O(n)` | `O(1)` | Each index before the destination is scanned once, while only the two reach boundaries and the jump count are stored. |
| Dynamic Programming | `O(n²)` | `O(n)` | In the worst case, every index updates a linear number of later destinations; the DP array stores one value per index. |
