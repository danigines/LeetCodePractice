## Explanation [_Optimal solution_]

A standard binary search can find one occurrence of `target`, but duplicates may continue on either side. To preserve logarithmic time, we perform two boundary searches.

For:

``` text
nums = [5, 7, 7, 8, 8, 10]
target = 8
```

we need two different insertion boundaries:

``` text
lower bound → first value >= 8 → index 3
upper bound → first value > 8  → index 5
```

The last occurrence is one position before the upper bound, so the result is `[3, 4]`.

### How does the lower bound work?

The lower bound keeps the first position where `target` could be inserted without breaking the sorted order.

``` swift
if nums[middle] < target {
    left = middle + 1
} else {
    right = middle
}
```

Values equal to `target` move `right` toward the beginning, ensuring that the search finishes at the first occurrence.

### How does the upper bound work?

The upper bound searches for the first value strictly greater than `target`:

``` swift
if nums[middle] <= target {
    left = middle + 1
} else {
    right = middle
}
```

Equal values now move `left` forward, placing the final boundary immediately after the last occurrence.

### How do we know whether the target exists?

The lower bound may point to the insertion position of a missing value or to `nums.count`.

Before calculating the final range, we verify that the position is valid and actually contains `target`:

``` swift
guard firstPosition < nums.count, nums[firstPosition] == target else {
    return [-1, -1]
}
```

### Why use a half-open search range?

Both helpers search within `[left, right)`, beginning with `right = nums.count`. This allows the answer to naturally become `nums.count` when no suitable value exists after the array.

### How to Recognize This Pattern

Think of **Binary Search Boundaries** when:

- the input is sorted and may contain duplicates
- the first or last occurrence is required
- an insertion boundary can describe the answer
- logarithmic runtime is required

## Explanation [_Second solution_]

The second solution first uses a standard binary search to find any occurrence of `target`.

Once found, it moves one index left and another right while neighboring values remain equal:

``` text
[5, 7, 7, 8, 8, 10]
          ← 8  8 →
```

This approach is direct and easy to understand, but the expansion can visit every element when the array contains many copies of `target`.

### What changes compared to the optimal solution?

Both solutions use constant auxiliary space.

The optimal solution finds both boundaries independently with binary search, guaranteeing `O(log n)`. The second solution uses binary search only for the first match and may then require a linear scan.

## Comparing solutions

| Aspect | Optimal solution: Two Bound Searches | Second solution: Search and Expand |
|:-------|:-----------------------------------:|:----------------------------------:|
| Advantages | Guarantees logarithmic time even with many duplicates. | Simple and reuses a familiar standard binary search. |
| Disadvantages | Requires two slightly different boundary conditions. | Expansion may become linear. |
| When to use it | When the required `O(log n)` guarantee must be preserved. | When duplicate runs are expected to be short. |
| Interview recommendation | Preferred because it fully satisfies the runtime requirement. | Useful as a baseline before optimizing both boundaries. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Bound Searches | `O(log n)` | `O(1)` | Two binary searches repeatedly halve their ranges while storing only indices. |
| Search and Expand | `O(n)` | `O(1)` | Binary search is logarithmic, but expanding across a duplicate run may inspect the entire array. |
