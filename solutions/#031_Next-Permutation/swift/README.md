## Explanation [_Optimal solution_]

The next permutation must be only slightly greater than the current one. Therefore, we should change a position as far to the right as possible.

For:

``` text
nums = [1, 3, 5, 4, 2]
```

the suffix `[5, 4, 2]` is already in descending order, so it is its greatest possible arrangement. The `3` immediately before it is the rightmost value that can be increased.

### Step 1: Find the pivot

Starting from the right, find the first index where:

``` text
nums[pivot] < nums[pivot + 1]
```

In the example, the pivot is `3`:

``` text
[1, 3, 5, 4, 2]
    ↑
```

If no pivot exists, the entire array is descending and already represents the greatest permutation. Reversing it produces the smallest permutation.

### Step 2: Find the successor

The pivot must be replaced by the smallest value in the suffix that is greater than it.

Because the suffix is descending, the first greater value found from the right is the correct successor:

``` text
[1, 3, 5, 4, 2]
    ↑     ↑
  pivot successor
```

After swapping them:

``` text
[1, 4, 5, 3, 2]
```

### Step 3: Reverse the suffix

The prefix is now the smallest possible increase. To obtain the closest lexicographically greater permutation, the suffix must be placed in its lowest order.

The suffix remains descending after the swap, so reversing it is sufficient:

``` text
[1, 4, 5, 3, 2] → [1, 4, 2, 3, 5]
```

### Why does this handle duplicate values?

The pivot uses a strict `<` comparison, and the successor must be strictly greater than the pivot. Equal values are skipped, preventing a swap that would leave the permutation unchanged.

### How to Recognize This Pattern

Think of **Next Lexicographical Arrangement** when:

- the result must be the nearest greater ordering
- changes should happen as far right as possible
- a descending suffix marks the greatest arrangement for that prefix
- the transformation must happen in-place

## Explanation [_Second solution_]

The second solution finds the same pivot, but it does not rely on the suffix's descending order to finish the transformation.

It scans the entire suffix to choose the smallest value greater than the pivot. After the swap, it uses selection sort to arrange the suffix in ascending order.

``` text
find pivot → choose smallest greater value → sort suffix
```

If no pivot exists, the suffix begins at index `0`, so selection sort rearranges the entire array into its smallest permutation.

### What changes compared to the optimal solution?

Both solutions modify the array in-place and use constant auxiliary space.

The optimal solution recognizes that the suffix is descending and reverses it in linear time. The second solution explicitly searches and sorts, which is easier to derive from the definition but performs more comparisons.

## Comparing solutions

| Aspect | Optimal solution: Pivot and Reverse | Second solution: Pivot and Selection Sort |
|:-------|:-----------------------------------:|:-----------------------------------------:|
| Advantages | Linear time and constant auxiliary space. | Directly chooses the next value and explicitly sorts the suffix. |
| Disadvantages | Requires recognizing the descending-suffix property. | Uses quadratic time to order the suffix. |
| When to use it | Whenever an efficient in-place next permutation is required. | As a simpler conceptual bridge from the permutation definition. |
| Interview recommendation | Preferred because it is the standard optimal solution. | Useful as a valid baseline before identifying the reversal optimization. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Pivot and Reverse | `O(n)` | `O(1)` | The pivot, successor, and suffix are each scanned at most once, using only indices. |
| Pivot and Selection Sort | `O(n²)` | `O(1)` | Selection sort may compare every pair of positions in the suffix while using only fixed indices. |
