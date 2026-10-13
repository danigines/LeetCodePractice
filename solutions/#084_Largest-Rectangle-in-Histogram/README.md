# 84. Largest Rectangle in Histogram

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![stack](../../src/images/badges/topics/stack.svg)](../../src/md/topics/Stack.md)
[![monotonic-stack](../../src/images/badges/topics/monotonic-stack.svg)](../../src/md/topics/Monotonic_Stack.md)

Given an array of integers `heights` representing the histogram's bar height where the width of each bar is `1`, return the area of the largest rectangle in the histogram.

### Example 1
> ![Histogram whose largest rectangle has an area of ten units](https://assets.leetcode.com/uploads/2021/01/04/histogram.jpg)
>
> **Input**: heights = [2,1,5,6,2,3]
>
> **Output**: 10
>
> **Explanation**: The above is a histogram where width of each bar is 1.
> The largest rectangle is shown in the red area, which has an area = 10 units.

### Example 2
> ![Histogram with bars of heights two and four](https://assets.leetcode.com/uploads/2021/01/04/histogram-1.jpg)
>
> **Input**: heights = [2,4]
>
> **Output**: 4

## Constraints
- `1 <= heights.count <= 10⁵`
- `0 <= heights[index] <= 10⁴`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/largest-rectangle-in-histogram/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/84/
