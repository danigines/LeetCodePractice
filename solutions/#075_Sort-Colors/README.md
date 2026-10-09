# 75. Sort Colors

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)
[![sorting](../../src/images/badges/topics/sorting.svg)](../../src/md/topics/Sorting.md)

You are given an array `nums` with `n` objects colored red, white, or blue. Sort them [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

The integers `0`, `1`, and `2` represent red, white, and blue, respectively.

You must solve this problem without using the library's sort function.

### Example 1
> **Input**: nums = [2,0,2,1,1,0]
>
> **Output**: [0,0,1,1,2,2]
>
> **Explanation**: The array has two `0`s, two `1`s, and two `2`s. Sorting them in-place places all `0`s first, then all `1`s, and finally all `2`s.

### Example 2
> **Input**: nums = [2,0,1]
>
> **Output**: [0,1,2]
>
> **Explanation**: The array has one of each value, arranged in-place in the order `0`, `1`, and `2`.

## Constraints
- `n == nums.count`
- `1 <= n <= 300`
- `nums[index]` is either `0`, `1`, or `2`.

## Follow-up
Could you come up with a one-pass algorithm using only constant extra space?

<details>
<summary>💡 Hint 1</summary>
A rather straightforward solution is a two-pass algorithm using counting sort.
</details>
<details>
<summary>💡 Hint 2</summary>
Iterate through the array and count the number of `0`s, `1`s, and `2`s.
</details>
<details>
<summary>💡 Hint 3</summary>
Overwrite the array with the total number of `0`s, followed by `1`s and then `2`s.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/sort-colors/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/75/
