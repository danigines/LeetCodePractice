## Explanation [_Optimal solution_]

Merge from right to left so writing into the unused end of `nums1` never overwrites an element that still needs to be compared.

Use three indices:

- `first` points to the last valid element among the first `m` positions of `nums1`.
- `second` points to the last element of `nums2`.
- `write` points to the last unfilled position in `nums1`.

Place the larger current value at `write`, then move the corresponding index and `write` one position left.

``` swift
if first >= 0, nums1[first] > nums2[second] {
    nums1[write] = nums1[first]
    first -= 1
} else {
    nums1[write] = nums2[second]
    second -= 1
}
```

Stop when `nums2` is exhausted. Any remaining valid values from `nums1` are already in their correct positions.

### How to Recognize This Pattern

Consider **Reverse Two-Pointer Merging** when the destination array has empty capacity at the end and writing from the front would overwrite unread values.

## Explanation [_Second solution_]

Merge from left to right into a separate array. Compare one value from each input, append the smaller one, and advance its pointer.

After either input is exhausted, append the remaining values from the other input and assign the completed array to `nums1`.

``` swift
while first < m, second < n {
    if nums1[first] <= nums2[second] {
        merged.append(nums1[first])
        first += 1
    } else {
        merged.append(nums2[second])
        second += 1
    }
}
```

This is the standard merge operation, but it requires linear auxiliary space.

## Comparing solutions

| Aspect | Optimal solution: Reverse Merge | Second solution: Auxiliary Array |
|:-------|:-------------------------------:|:--------------------------------:|
| Advantages | Modifies `nums1` directly with constant auxiliary space. | Follows the conventional left-to-right merge process. |
| Disadvantages | Reverse indices and empty-input boundaries require care. | Allocates a second array containing the complete result. |
| When to use it | When the destination already has capacity for every merged value. | When extra memory is acceptable and clarity is the priority. |
| Interview recommendation | Preferred because it satisfies the follow-up and uses the provided buffer efficiently. | Useful as the natural baseline before deriving the in-place version. |

## Complexity comparison

Let `m` be the number of valid elements initially stored in `nums1`, and `n` the number of elements in `nums2`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Reverse Merge | `O(m + n)` | `O(1)` | Each of the `m + n` values is considered at most once, and only three indices are stored. |
| Auxiliary Array | `O(m + n)` | `O(m + n)` | Every input value is appended once, while the temporary array stores all `m + n` merged values. |
