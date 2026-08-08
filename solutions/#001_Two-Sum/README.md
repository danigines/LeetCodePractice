# 1. Two Sum

![Difficulty](./src/images/badges/difficulty/easy.svg)
![Topic_01](./src/images/badges/topics/array.svg)
![Topic_02](./src/images/badges/topics/hash-table.svg)

Given an array of integers `nums` and an integer `target`, return _indices of two different elements whose values add up to `target`_.

You may assume that each input would have **exactly one solution**, and you may not use the same element twice.

You can return the answer in any order.

### Example 1
> **Input**: nums = [2,7,11,15], target = 9
> **Output**: [0,1]
> **Explanation**: Because nums[0] + nums[1] == 9, we return [0, 1].

### Example 2
> **Input**: nums = [3,2,4], target = 6
> **Output**: [1,2]

### Example 3
> **Input**: nums = [3,3], target = 6
> **Output**: [0,1]

### Constraints
- `2 <= nums.count <= 10^4`
- `-10^9 <= nums[i] <= 10^9`
- `-10^9 <= target <= 10^9`
- **Only one valid answer exists**.

**Follow-up**: Can you come up with an algorithm that is less than `O(n2)` time complexity?

<details>
<summary>📖 Hint 1</summary>
A really brute force way would be to search for all possible pairs of numbers but that would be too slow. Again, it's best to try out brute force solutions just for completeness. It is from these brute force solutions that you can come up with optimizations.
</details>
<details>
<summary>📖 Hint 2</summary>
So, if we fix one of the numbers, say `x`, we have to scan the entire array to find the next number `y` which is `value - x` where value is the input parameter. Can we change our array somehow so that this search becomes faster?
</details>
<details>
<summary>📖 Hint 3</summary>
The second train of thought is, without changing the array, can we use additional space somehow? Like maybe a hash map to speed up the search?
</details>

_LeetCode URL_: https://leetcode.com/problems/two-sum/description/
_Wiki_: https://leetcode.doocs.org/en/lc/1/
