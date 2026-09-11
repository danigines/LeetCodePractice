## Explanation [_Optimal solution_]

A rotated sorted array is formed by two ascending sections:

``` text
[4, 5, 6, 7 | 0, 1, 2]
```

Although the complete search range may cross the rotation point, at least one half around `middle` is always sorted.

### How do we identify the sorted half?

If the value at `left` is less than or equal to the value at `middle`, the left half is sorted:

``` swift
if nums[left] <= nums[middle] {
    // Left half is sorted.
}
```

Otherwise, the rotation point is inside the left half, which means the right half is sorted.

The values are distinct, so these comparisons identify the ordered side without ambiguity.

### How do we choose which half to keep?

Once the sorted half is known, its boundary values tell us whether it contains `target`.

For the sorted left half:

``` swift
if nums[left] <= target && target < nums[middle] {
    right = middle - 1
} else {
    left = middle + 1
}
```

The same reasoning is applied symmetrically when the right half is sorted.

### Example

For:

``` text
nums = [4, 5, 6, 7, 0, 1, 2]
target = 0
```

the first middle value is `7`. The left half `[4, 5, 6, 7]` is sorted, but `0` is not inside its range, so we keep the right half.

The search continues until `0` is found at index `4`.

### Why is the runtime logarithmic?

Every iteration discards half of the remaining indices, just like a standard binary search. The rotation changes the condition used to select a half, but not the rate at which the search range shrinks.

### How to Recognize This Pattern

Think of **Modified Binary Search** when:

- an array was sorted before a transformation such as rotation
- values are distinct
- one side of every midpoint remains ordered
- logarithmic runtime is required

## Explanation [_Second solution_]

The second solution separates the problem into two binary searches.

First, it locates the smallest value, which is also the rotation index:

``` text
[4, 5, 6, 7, 0, 1, 2]
             ↑
       rotation index
```

When `nums[middle] > nums[right]`, the minimum must be to the right of `middle`. Otherwise, the minimum is at `middle` or to its left.

After finding the rotation index, both sides are ordinary sorted ranges:

``` text
[4, 5, 6, 7] [0, 1, 2]
```

The target's value determines which range can contain it, and a standard binary search finishes the lookup.

### What changes compared to the optimal solution?

Both solutions run in logarithmic time and use constant auxiliary space.

The primary solution finds the target directly in one binary-search loop. The second solution is more modular and makes the rotation point explicit, but performs a separate search before looking for the target.

## Comparing solutions

| Aspect | Optimal solution: One-Pass Modified Search | Second solution: Pivot Then Search |
|:-------|:------------------------------------------:|:----------------------------------:|
| Advantages | Finds the target directly with one search loop. | Separates rotation detection from standard binary search. |
| Disadvantages | Its range conditions require careful boundary handling. | May perform two logarithmic searches. |
| When to use it | When the shortest direct solution is preferred. | When the rotation index is useful or clearer conceptually. |
| Interview recommendation | Preferred because it demonstrates the central sorted-half insight. | Strong alternative that is easy to reason about in stages. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| One-Pass Modified Search | `O(log n)` | `O(1)` | Every iteration discards half of the remaining range while storing only indices. |
| Pivot Then Search | `O(log n)` | `O(1)` | Finding the rotation and searching one sorted side are both logarithmic and use fixed variables. |
