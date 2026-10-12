## Explanation [_Optimal solution_]

Use binary search while identifying which half is sorted at every step.

Duplicates introduce one ambiguous case: when `nums[left]`, `nums[middle]`, and `nums[right]` are equal, their values do not reveal which half contains the rotation. Discard the two equal boundaries and continue.

``` swift
if nums[left] == nums[middle], nums[middle] == nums[right] {
    left += 1
    right -= 1
    continue
}
```

Otherwise, at least one half is ordered:

- If `nums[left] <= nums[middle]`, the left half is sorted.
- Otherwise, the right half is sorted.

Check whether `target` falls inside the sorted half. Keep that half when it does; otherwise, search the other half.

``` swift
if nums[left] <= nums[middle] {
    if nums[left] <= target, target < nums[middle] {
        right = middle - 1
    } else {
        left = middle + 1
    }
} else {
    if nums[middle] < target, target <= nums[right] {
        left = middle + 1
    } else {
        right = middle - 1
    }
}
```

### How to Recognize This Pattern

Consider **Modified Binary Search with Ambiguous Duplicates** when a sorted array is rotated and equal boundary values can hide which side is ordered.

## Explanation [_Second solution_]

Inspect every value from left to right and return immediately when one equals `target`.

``` swift
for number in nums {
    if number == target {
        return true
    }
}

return false
```

This ignores the rotated ordering, but its worst-case time matches the unavoidable worst case of binary search when duplicates make every comparison ambiguous.

## Comparing solutions

| Aspect | Optimal solution: Modified Binary Search | Second solution: Linear Search |
|:-------|:---------------------------------------:|:------------------------------:|
| Advantages | Usually discards half of the search range and can run in logarithmic time. | Very simple and unaffected by rotation or duplicates. |
| Disadvantages | May degrade to linear time when equal values hide the sorted half. | Never benefits from the array's partial ordering. |
| When to use it | When reducing the average number of comparisons matters. | When simplicity is more important or inputs are very small. |
| Interview recommendation | Preferred because it addresses the rotated structure and explains the duplicate-value limitation. | Use as the baseline and worst-case comparison. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Modified Binary Search | Average `O(log n)`, worst `O(n)` | `O(1)` | Ordered halves are normally discarded, but equal left, middle, and right values may force the boundaries to shrink one step at a time. |
| Linear Search | `O(n)` | `O(1)` | Up to all `n` values are inspected, and only the loop value is stored. |
