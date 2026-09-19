# 41. First Missing Positive

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)

Given an unsorted integer array `nums`, return the smallest positive integer that is not present in it.

The intended algorithm must run in `O(n)` time and use `O(1)` auxiliary space.

### Example 1
> **Input**: nums = [1,2,0]
>
> **Output**: 3
>
> **Explanation**: Both 1 and 2 are present, so 3 is the first missing positive.

### Example 2
> **Input**: nums = [3,4,-1,1]
>
> **Output**: 2
>
> **Explanation**: The array contains 1 but not 2.

### Example 3
> **Input**: nums = [7,8,9,11,12]
>
> **Output**: 1
>
> **Explanation**: No positive integer from 1 through the array length is present.

## Constraints
- `1 <= nums.length <= 10⁵`
- `-2³¹ <= nums[i] <= 2³¹ - 1`

<details>
<summary>💡 Hint 1</summary>
Think of a solution that uses extra storage. Can the input array itself represent which values are present?
</details>
<details>
<summary>💡 Hint 2</summary>
Duplicates, zero, and negative values cannot change which positive integer is missing first.
</details>
<details>
<summary>💡 Hint 3</summary>
Several linear passes over the array still give `O(n)` total time.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/first-missing-positive/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/41/
