## Explanation [_Optimal solution_]

Permutations in lexicographical order form equal-sized blocks. If `n` digits remain, fixing the next digit leaves `(n - 1)!` arrangements of the other digits.

For example, with `[1, 2, 3, 4]`, each possible first digit begins a block of `3! = 6` permutations. Convert `k` to a zero-based rank, divide it by the block size to select the next digit, and keep the remainder as the rank inside that block.

``` swift
let blockSize = factorial[remaining - 1]
let index = rank / blockSize
rank %= blockSize
result += String(numbers.remove(at: index))
```

Repeat until no digits remain. This skips entire blocks instead of generating the earlier permutations.

### How to Recognize This Pattern

Consider the **Factorial Number System** when permutations are ordered lexicographically and the task asks for one permutation by rank rather than every arrangement.

## Explanation [_Second solution_]

Backtracking chooses unused digits from smallest to largest, which generates permutations directly in lexicographical order. Count completed permutations and stop as soon as the `k`th one is reached.

``` text
choose an unused digit
recurse to the next position
undo the choice
```

This avoids storing all permutations, but it still constructs every permutation before the target and becomes factorial in the worst case.

## Comparing solutions

| Aspect | Optimal solution: Factorial Blocks | Second solution: Ordered Backtracking |
|:-------|:----------------------------------:|:-------------------------------------:|
| Advantages | Jumps directly to the requested permutation. | Closely follows the definition of lexicographical generation. |
| Disadvantages | Requires converting the one-based rank and reasoning about factorial blocks. | May explore nearly all `n!` permutations. |
| When to use it | When only one ranked permutation is required. | When `n` is very small or all earlier permutations are also relevant. |
| Interview recommendation | Preferred; demonstrate one block-selection step. | Present as the natural baseline before optimization. |

## Complexity comparison

Let `n` be the number of digits and `k` the requested one-based permutation rank.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Factorial Blocks | `O(n²)` | `O(n)` | Selecting each of the `n` digits is direct, but removing it from a Swift array costs `O(n)`; the factorial and remaining-digit arrays are linear. |
| Ordered Backtracking | `O(n × n!)` worst case | `O(n)` auxiliary | When `k` is near `n!`, the search may inspect and construct nearly every permutation; the path, usage array, and recursion depth are linear. |
