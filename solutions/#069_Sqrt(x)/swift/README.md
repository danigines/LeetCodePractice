## Explanation [_Optimal solution_]

The integer square root is the largest integer whose square does not exceed `x`. This condition is monotonic: once a candidate is too large, every greater candidate is also too large. Therefore, use binary search.

For `x >= 2`, the answer lies between `1` and `x / 2`. When the middle candidate is valid, save it and search to the right for a larger valid value. Otherwise, search to the left.

Compare `middle <= x / middle` instead of `middle * middle <= x` to avoid multiplication overflow.

``` swift
while low <= high {
    let middle = low + (high - low) / 2

    if middle <= x / middle {
        answer = middle
        low = middle + 1
    } else {
        high = middle - 1
    }
}
```

### How to Recognize This Pattern

Consider **Binary Search on the Answer** when candidate values are ordered and a monotonic condition separates valid candidates from invalid ones.

## Explanation [_Second solution_]

Start at zero and test consecutive integers. Continue while the next integer is still a valid square-root candidate, then return the current value.

``` swift
var root = 0

while root + 1 <= x / (root + 1) {
    root += 1
}

return root
```

The division-based comparison again prevents overflow. This approach follows the definition directly, but it does not take advantage of the ordered search space.

## Comparing solutions

| Aspect | Optimal solution: Binary Search | Second solution: Linear Search |
|:-------|:-------------------------------:|:------------------------------:|
| Advantages | Discards half of the remaining candidates at every step. | Very simple and directly checks consecutive candidates. |
| Disadvantages | Requires careful boundary and saved-answer handling. | Checks every integer through the final square root. |
| When to use it | When the answer range is ordered and the validity condition is monotonic. | When the range is small or when first deriving the validity condition. |
| Interview recommendation | Preferred because it is efficient and demonstrates binary search on the answer. | Useful as the initial brute-force approach before optimization. |

## Complexity comparison

Let `x` be the input integer.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Binary Search | `O(log x)` | `O(1)` | Each iteration halves the candidate range and stores only boundary variables. |
| Linear Search | `O(√x)` | `O(1)` | Every integer candidate through the rounded-down square root may be checked, while only the current candidate is stored. |
