## Explanation [_Optimal solution_]

For every number, we calculate the complement needed to reach `target`:

```text
complement = target - currentValue
```

For `nums = [2, 7, 11, 15]` and `target = 9`:

```text
currentValue = 2 → complement = 7
currentValue = 7 → complement = 2
```

When we reach `7`, the `Dictionary` already contains the index of `2`, so we return both indices.

### Why search before inserting?

We first search for the complement and insert the current value afterward:

``` swift
if let complementIndex = indexByValue[complement] {
    return [complementIndex, currentIndex]
}

indexByValue[currentValue] = currentIndex
```

This prevents the same array position from being used twice.

### How to Recognize This Pattern

Think of a **Hash Table** when:

- a pair must satisfy a target value
- the missing value can be calculated directly
- fast lookup is more important than preserving constant space

The key idea is to store previous values so each new number can immediately ask whether its complement already exists.

## Explanation [_Second solution_]

The alternative stores each value with its original index, sorts the pairs, and uses two pointers.

If the current sum is too small, move the left pointer forward. If it is too large, move the right pointer backward.

Sorting loses the original positions, so every value must remain paired with its original index:

``` swift
(index: originalIndex, value: number)
```

### What changes compared to the optimal solution?

The `Dictionary` finds the answer in one average linear pass. Sorting enables Two Pointers but increases the running time and requires an auxiliary array to preserve indices.

## Comparing solutions

| Aspect | Optimal solution: Dictionary | Second solution: Sorting + Two Pointers |
|:-------|:----------------------------:|:---------------------------------------:|
| Advantages | Average linear time, one pass, and direct preservation of indices. | Introduces the Two Pointers technique and efficiently discards impossible pairs after sorting. |
| Disadvantages | Requires additional memory and hashing. | Sorting increases the running time and requires preserving original indices. |
| When to use it | When a complement can be calculated and fast lookups are needed. | When the data is already sorted or Two Pointers fits naturally. |
| Interview recommendation | Preferred because it is direct and achieves average linear time. | Useful alternative for demonstrating sorting and Two Pointers. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Dictionary | Average `O(n)` | `O(n)` | `n` is the number of elements in `nums`. Each element is processed once, and up to `n` values and indices are stored. |
| Sorting + Two Pointers | `O(n log n)` | `O(n)` | `n` is the number of elements. Sorting takes `O(n log n)`, and the indexed copy stores `n` pairs. |
