## Explanation [_Optimal solution_]

The requested position is the first index whose value is greater than or equal to `target`. This is also known as the lower bound.

For:

``` text
nums = [1, 3, 5, 6]
target = 2
```

the first value greater than or equal to `2` is `3`, at index `1`. Inserting `2` there preserves the sorted order.

### How does the binary search work?

We search inside the half-open range `[left, right)`, starting with:

``` swift
var left = 0
var right = nums.count
```

If the middle value is smaller than `target`, neither that position nor anything before it can be the answer:

``` swift
if nums[middle] < target {
    left = middle + 1
}
```

Otherwise, `middle` may be the answer, so it remains inside the search range:

``` swift
else {
    right = middle
}
```

### Why does this also work when the target exists?

Because all values are distinct, the first value greater than or equal to `target` is its exact position when it exists.

``` text
nums = [1, 3, 5, 6]
target = 5
               ↑ index 2
```

### What happens at the array boundaries?

- If `target` is smaller than every value, the boundaries meet at index `0`.
- If `target` is greater than every value, they meet at `nums.count`.
- Otherwise, they meet between the nearest smaller and greater values.

Using `nums.count` as the initial right boundary naturally represents insertion after the final element.

### How to Recognize This Pattern

Think of **Lower-Bound Binary Search** when:

- the input is sorted
- a value or its insertion position is required
- the first value satisfying a condition is the answer
- logarithmic runtime is required

## Explanation [_Second solution_]

The linear solution checks each value from left to right and returns the first index where:

``` swift
number >= target
```

That position either contains `target` or is the first value that must remain after it.

If the loop finishes, every value is smaller than `target`, so the insertion position is `nums.count`.

### What changes compared to the optimal solution?

Both solutions use constant auxiliary space and return the same lower-bound position.

The binary search discards half of the remaining positions on every iteration. The linear solution is simpler but may inspect the entire array, so it does not satisfy the requested logarithmic runtime.

## Comparing solutions

| Aspect | Optimal solution: Lower-Bound Search | Second solution: Linear Scan |
|:-------|:------------------------------------:|:----------------------------:|
| Advantages | Guarantees logarithmic time. | Very direct and easy to implement. |
| Disadvantages | Requires careful half-open boundary handling. | May inspect every element. |
| When to use it | When the input is sorted and performance matters. | When the collection is very small. |
| Interview recommendation | Preferred because it satisfies the required complexity. | Useful as a simple baseline before optimization. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Lower-Bound Search | `O(log n)` | `O(1)` | Every iteration halves the search range while storing only two boundaries and a midpoint. |
| Linear Scan | `O(n)` | `O(1)` | In the worst case, every element is inspected before returning the final insertion position. |
