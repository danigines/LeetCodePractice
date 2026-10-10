## Explanation [_Optimal solution_]

Use `write` as the length of the valid prefix. The first two values are always allowed. After that, a value may be written only when it differs from the value already stored two positions before `write`.

``` swift
for read in nums.indices {
    let number = nums[read]

    if write < 2 || number != nums[write - 2] {
        nums[write] = number
        write += 1
    }
}
```

Because the array is sorted, equality with `nums[write - 2]` means the valid prefix already contains two copies of `number`. A different value can safely be appended.

This rule generalizes to allowing at most `limit` copies by comparing with `nums[write - limit]`.

### How to Recognize This Pattern

Consider **Read and Write Pointers** when a sorted array must be compacted in-place while preserving order and allowing only a fixed number of duplicates.

## Explanation [_Second solution_]

Track how many times the current value has appeared consecutively. Since the array is sorted, equal values form one contiguous group.

Copy a value to the write position only when its current count is at most two.

``` swift
for read in 1..<nums.count {
    if nums[read] == previous {
        occurrenceCount += 1
    } else {
        previous = nums[read]
        occurrenceCount = 1
    }

    if occurrenceCount <= 2 {
        nums[write] = nums[read]
        write += 1
    }
}
```

This approach states the duplicate limit directly, but it requires extra state for the previous value and its count.

## Comparing solutions

| Aspect | Optimal solution: Two-Back Comparison | Second solution: Occurrence Counting |
|:-------|:-------------------------------------:|:------------------------------------:|
| Advantages | Compact, constant-space, and easily generalized to any fixed limit. | Makes the number of occurrences explicit. |
| Disadvantages | The comparison with `write - 2` may be less intuitive initially. | Requires maintaining and resetting a run counter correctly. |
| When to use it | When compacting a sorted array with a fixed duplicate allowance. | When the logic depends on the exact size of each consecutive group. |
| Interview recommendation | Preferred after explaining what the valid prefix represents. | A clear alternative that follows each duplicate run directly. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two-Back Comparison | `O(n)` | `O(1)` | Every value is read once, and only the read and write indices are stored. |
| Occurrence Counting | `O(n)` | `O(1)` | Every value is read once, while the previous value, its count, and two indices use constant space. |
