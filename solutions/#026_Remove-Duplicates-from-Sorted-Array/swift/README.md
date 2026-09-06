## Explanation [_Optimal solution_]

Because `nums` is sorted, equal values are next to each other.

We use two indices:

```text
readIndex  → examines every element
writeIndex → indicates where the next unique value belongs
```

For:

```text
nums = [1, 1, 2]
```

the process is:

```text
Keep 1          → [1, 1, 2], writeIndex = 1
Skip second 1   → [1, 1, 2], writeIndex = 1
Write 2         → [1, 2, 2], writeIndex = 2
```

Only the first `writeIndex` positions matter, so the function returns `2`.

### Why does sorting matter?

When the current value differs from the last unique value, we know it has not appeared earlier in the unique prefix.

``` swift
if nums[readIndex] != nums[writeIndex - 1]
```

Without sorted input, equal values could appear in different parts of the array and this comparison would not be sufficient.

### Why does `writeIndex` start at 1?

The constraints guarantee at least one element, so the first value is always unique and already occupies the correct position.

Therefore, the next unique value belongs at index `1`.

### Why don't we remove elements from the array?

Removing an array element shifts every later element and can make the solution unnecessarily expensive.

The custom judge only checks:

- the returned unique count
- the first `k` positions

We overwrite that valid prefix and ignore the remaining positions.

### How to Recognize This Pattern

Think of **Same-Direction Two Pointers** when:

- the array must be modified in place
- one pointer reads every value
- another pointer builds a valid prefix
- unwanted values can be skipped without preserving the suffix

This is sometimes called the **read/write pointer** pattern.

## Explanation [_Second solution_]

The alternative uses a `Set` to remember which values have already appeared and an auxiliary array to collect unique values.

``` swift
if seenValues.insert(number).inserted {
    uniqueValues.append(number)
}
```

Because the original array is traversed in sorted order, `uniqueValues` also remains sorted.

Afterward, those values are copied into the beginning of `nums`, and their count is returned.

### What changes compared to the optimal solution?

Both solutions process the array once on average.

The Two Pointers solution takes advantage of the sorted input and modifies the valid prefix using constant auxiliary space. The `Set` solution is easy to understand but stores the unique values twice and does not satisfy the intended in-place constraint.

## Comparing solutions

| Aspect | Optimal solution: Two Pointers | Second solution: Set + Auxiliary Array |
|:-------|:------------------------------:|:--------------------------------------:|
| Advantages | Linear time, constant auxiliary space, and true in-place modification. | Explicit duplicate tracking and straightforward reasoning. |
| Disadvantages | Depends on the input being sorted. | Uses linear auxiliary memory and ignores the strongest property of the input. |
| When to use it | When a sorted array must be compacted in place. | When additional space is allowed or the input is not guaranteed to group duplicates. |
| Interview recommendation | Preferred because it directly satisfies every requirement. | Useful as an initial idea before optimizing to Two Pointers. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Pointers | `O(n)` | `O(1)` | `n` is the number of elements in `nums`. Each value is read once, and only two indices are maintained. |
| Set + Auxiliary Array | Average `O(n)` | `O(n)` | `n` is the number of elements. Every value is checked once on average, while the `Set` and unique-value array may each store up to `n` elements. |
