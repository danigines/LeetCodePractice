# 42. Trapping Rain Water

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![stack](../../src/images/badges/topics/stack.svg)](../../src/md/topics/Stack.md)
[![monotonic-stack](../../src/images/badges/topics/monotonic-stack.svg)](../../src/md/topics/Monotonic_Stack.md)

Given `n` non-negative integers representing an elevation map, where each bar has width `1`, calculate how much rainwater can be trapped between the bars.

### Example 1
> ![Elevation map showing six units of trapped water](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)
>
> **Input**: height = [0,1,0,2,1,0,1,3,2,1,2,1]
>
> **Output**: 6
>
> **Explanation**: The lower bars between taller boundaries trap six units of water in total.

### Example 2
> **Input**: height = [4,2,0,3,2,5]
>
> **Output**: 9

## Constraints
- `n == height.length`
- `1 <= n <= 2 × 10⁴`
- `0 <= height[i] <= 10⁵`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/trapping-rain-water/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/42/
