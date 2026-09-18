## Explanation [_Optimal solution_]

For an array of length `n`, the answer must be in `1...n + 1`. Every value `x` in `1...n` belongs at index `x - 1`; zero, negative numbers, and values larger than `n` cannot fill those positions.

We repeatedly swap a useful value into its destination:

``` swift
let target = values[index] - 1
if values[target] == values[index] { break }
values.swapAt(index, target)
```

The equality check stops duplicate values from swapping forever. Once placement is finished, the first index whose value is not `index + 1` reveals the answer. If every position matches, return `n + 1`.

``` text
Input:  [3, 4, -1, 1]
Placed: [1, -1, 3, 4]
              ^
Index 1 should hold 2, so the answer is 2.
```

### Why is placement linear?

Each swap puts at least one value into its final position. There can be at most `n` such placements, even though the swaps are inside a `while` loop.

### How to Recognize This Pattern

Consider **index placement** when the answer is a missing number in a bounded range and array values can be mapped directly to indices. Guard against out-of-range values and duplicate destinations before swapping.

## Explanation [_Second solution_]

Insert every number into a `Set`, then test `1, 2, 3, ...` until a number is absent. This is easy to read, but the set needs linear auxiliary space and therefore does not satisfy the problem's space target.

## Comparing solutions

| Aspect | Optimal solution: Index Placement | Second solution: Set |
|:-------|:---------------------------------:|:--------------------:|
| Advantages | Linear time and constant auxiliary space when the input is mutable in place. | Simple membership checks. |
| Disadvantages | Requires careful bounds and duplicate checks. | Uses linear auxiliary space. |
| When to use it | When the constant-space constraint matters. | When extra space is allowed. |
| Interview recommendation | Explain the value-to-index mapping and the duplicate guard. | Useful as a baseline before optimizing space. |

## Complexity comparison

Let `n` be the number of elements. Set operations are expected `O(1)` on average.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Index Placement | `O(n)` | `O(1)` algorithmically; `O(n)` in this Swift implementation | At most `n` placements plus one scan. The LeetCode Swift signature takes an immutable `[Int]`; mutating `var values = nums` triggers copy-on-write storage. |
| Set | `O(n)` expected | `O(n)` | Build the set, then check at most `n + 1` candidates. |

The index-placement algorithm meets the constant-space target with a mutable input array. Under the required Swift value-parameter signature, the copy is unavoidable for this implementation; the table distinguishes algorithmic auxiliary space from actual Swift storage.
