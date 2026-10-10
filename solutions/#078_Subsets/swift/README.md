## Explanation [_Optimal solution_]

Every current path is a valid subset, including the empty path. Add it to the result first, then try appending each available number from `start` onward.

After exploring all subsets that include a number, remove it so the next iteration can explore a different choice.

``` swift
func backtrack(_ start: Int) {
    results.append(subset)

    guard start < nums.count else {
        return
    }

    for index in start..<nums.count {
        subset.append(nums[index])
        backtrack(index + 1)
        subset.removeLast()
    }
}
```

Passing `index + 1` keeps every path in the input order and prevents choosing the same element more than once. Because all input values are unique, this generates every subset exactly once.

### How to Recognize This Pattern

Consider **Backtracking over All Path Lengths** when every partial selection is a valid result and each element may be chosen at most once.

## Explanation [_Second solution_]

An array with `n` elements has `2ⁿ` subsets because each element has two states: excluded or included.

Represent every subset with a bitmask from `0` through `2ⁿ - 1`. Bit `index` indicates whether `nums[index]` belongs to the current subset.

``` swift
let subsetCount = 1 << nums.count

for mask in 0..<subsetCount {
    var subset: [Int] = []

    for index in nums.indices {
        if mask & (1 << index) != 0 {
            subset.append(nums[index])
        }
    }

    results.append(subset)
}
```

This avoids recursion and maps each possible selection directly to one integer.

## Comparing solutions

| Aspect | Optimal solution: Backtracking | Second solution: Bitmask Enumeration |
|:-------|:------------------------------:|:------------------------------------:|
| Advantages | Expresses the subset construction naturally and extends easily to pruning rules. | Avoids recursion and gives each subset a direct binary representation. |
| Disadvantages | Uses a recursion stack and requires undoing each choice. | Requires understanding bit operations and inspects every bit for every mask. |
| When to use it | When subset generation may later require constraints or pruning. | When `n` is small and every subset must be enumerated without recursion. |
| Interview recommendation | Preferred because the choose-explore-unchoose pattern is easy to explain and reuse. | A strong alternative when discussing the connection between subsets and binary numbers. |

## Complexity comparison

Let `n` be the number of elements in `nums`. There are `2ⁿ` subsets. Space below excludes the returned subsets, which require `O(n × 2ⁿ)` space in total.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Backtracking | `O(n × 2ⁿ)` | `O(n)` | All `2ⁿ` subsets are copied, with up to `n` values each, while the current path and recursion stack have depth at most `n`. |
| Bitmask Enumeration | `O(n × 2ⁿ)` | `O(n)` | Every one of the `2ⁿ` masks checks `n` bit positions, and the temporary subset stores at most `n` values. |
