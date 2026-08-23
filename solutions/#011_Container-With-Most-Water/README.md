# 11. Container With Most Water

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)
[![greedy](../../src/images/badges/topics/greedy.svg)](../../src/md/topics/Greedy.md)

You are given an integer array `height` of length `n`. There are `n` vertical lines where the endpoints of the `i`th line are `(i, 0)` and `(i, height[i])`.

Find two lines that, together with the x-axis, form a container that can hold the maximum amount of water.

Return _the maximum amount of water a container can store_.

**Notice** that you may not slant the container.

### Example 1
![src](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)
> **Input**: height = [1,8,6,2,5,4,8,3,7]
> 
> **Output**: 49
> 
> **Explanation**: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

### Example 2
> **Input**: height = [1,1]
> 
> **Output**: 1

## Constraints
- `n == height.length`
- `2 <= n <= 10⁵`
- `0 <= height[i] <= 10⁴`

<details>
<summary>💡 Hint 1</summary>
If you simulate the problem, it will be O(n^2) which is not efficient.
</details>
<details>
<summary>💡 Hint 2</summary>
Try to use two-pointers. Set one pointer to the left and one to the right of the array. Always move the pointer that points to the lower line.
</details>
<details>
<summary>💡 Hint 3</summary>
How can you calculate the amount of water at each step?
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/container-with-most-water
* _Wiki_: https://leetcode.doocs.org/en/lc/11/
