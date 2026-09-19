## Explanation [_Optimal solution_]

Water above a bar depends on the shorter of its tallest left and right boundaries:

``` text
water at index i = min(left maximum, right maximum) - height[i]
```

Two pointers start at opposite ends. When the left bar is no taller than the right bar, the right side already has a boundary high enough for the current left bar. We can update the tallest left boundary, count water at `left`, and move inward. Otherwise, we do the symmetric operation on the right.

``` swift
if height[left] <= height[right] {
    leftMaximum = max(leftMaximum, height[left])
    trappedWater += leftMaximum - height[left]
    left += 1
}
```

We never need arrays of left and right maxima. Each pointer moves only inward, so every position is processed at most once.

### How to Recognize This Pattern

Consider **Two Pointers** when each position depends on boundaries on both sides and the side with the smaller current boundary can be finalized immediately.

## Explanation [_Second solution_]

A **monotonic decreasing stack** stores indices of bars whose right boundary has not yet been found. When a taller bar appears, the top of the stack becomes the bottom of a newly closed basin. The new stack top is its left boundary, and the current bar is its right boundary.

``` text
trapped layer = (right index - left index - 1)
              × (min(left height, right height) - bottom height)
```

Pop and count layers until the current bar is no longer taller than the stack top. A basin without a left boundary cannot trap water. Each index is pushed once and popped at most once.

The **Dynamic Programming** topic refers to another valid approach that precomputes left and right maximum arrays; neither Swift file here implements that variant.

## Comparing solutions

| Aspect | Optimal solution: Two Pointers | Second solution: Monotonic Stack |
|:-------|:------------------------------:|:--------------------------------:|
| Advantages | Constant extra space and direct per-bar counting. | Makes basin boundaries and water layers explicit. |
| Disadvantages | Requires a careful argument for processing the lower side. | Uses a stack and more index arithmetic. |
| When to use it | When optimizing both time and space. | When learning or applying monotonic-stack patterns. |
| Interview recommendation | Preferred for its `O(1)` auxiliary space. | Useful alternative if the boundary invariant is easier to explain. |

## Complexity comparison

Let `n` be the number of bars.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Pointers | `O(n)` | `O(1)` | Each pointer moves inward at most `n` times; only a few counters are stored. |
| Monotonic Stack | `O(n)` | `O(n)` | Every index enters and leaves the stack at most once; the stack may hold all indices. |
