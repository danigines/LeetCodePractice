## Explanation [_Optimal solution_]

Build the permutation one position at a time. At recursion level `position`, every earlier position is already fixed. Swap each remaining candidate into the current position, generate the rest, and undo the swap before trying another candidate.

``` swift
values.swapAt(position, candidate)
generate(position + 1)
values.swapAt(position, candidate)
```

The second swap is the backtracking step: it restores the array to the exact state expected by the next iteration. When `position == values.count`, every position is fixed and the current array is copied into the result.

``` text
[1, 2, 3]
├── fix 1 → permutations of [2, 3]
├── fix 2 → permutations of [1, 3]
└── fix 3 → permutations of [2, 1]
```

Because the input values are distinct, choosing a different remaining index always produces a different permutation; no duplicate check is needed.

### How to Recognize This Pattern

Consider **Backtracking by Swapping** when every element must occupy exactly one position and all possible orderings are required. The recursion depth represents the next position to fix.

## Explanation [_Second solution_]

The alternative keeps a separate `current` permutation and a Boolean `used` array. At every level, choose any unused input value, append it, recurse, then remove it and mark its index as available again.

This version makes the choice state explicit and is often easier to learn. The swap solution is more compact because the working array itself records which prefix is fixed and which suffix remains available.

## Comparing solutions

| Aspect | Optimal solution: In-Place Swaps | Second solution: Used Array |
|:-------|:--------------------------------:|:---------------------------:|
| Advantages | Uses the working array as both the path and remaining candidates. | Separates the path from the availability state. |
| Disadvantages | Requires every swap to be restored correctly. | Maintains an additional Boolean array and path. |
| When to use it | When the input can be rearranged during generation. | When explicit choice tracking is clearer. |
| Interview recommendation | Preferred once the swap invariant is understood. | A straightforward starting point for backtracking. |

## Complexity comparison

Let `n` be the number of elements in `nums`. There are `n!` permutations, and each returned permutation contains `n` elements. Output storage is excluded from auxiliary space.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| In-Place Swaps | `O(n × n!)` | `O(n)` auxiliary | Generating the recursion tree is bounded by the cost of copying all `n!` results of length `n`. The working copy and recursion stack each use linear space. |
| Used Array | `O(n × n!)` | `O(n)` auxiliary | Every complete permutation is copied in `O(n)` time. The path, `used` array, and recursion stack use linear space. |

The returned collection itself occupies `O(n × n!)` space for either solution.
