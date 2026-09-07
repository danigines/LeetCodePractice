# 27. Remove Element

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)

Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` [in-place](https://en.wikipedia.org/wiki/In-place_algorithm). The order of the elements may be changed. Then return the number of elements in `nums` which are not equal to `val`.

Consider the number of elements in `nums` which are not equal to `val` to be `k`. To get accepted, you need to do the following things:

- Change the array `nums` such that the first `k` elements contain the elements which are not equal to `val`. The remaining elements and the size of `nums` are not important.
- Return `k`.

### Custom Judge

The judge will test your solution with the following code:

```text
int[] nums = [...]; // Input array
int val = ...; // Value to remove
int[] expectedNums = [...]; // The expected answer with correct length.
                            // It is sorted with no values equaling val.

int k = removeElement(nums, val); // Calls your implementation

assert k == expectedNums.length;
sort(nums, 0, k); // Sort the first k elements of nums
for (int i = 0; i < actualLength; i++) {
    assert nums[i] == expectedNums[i];
}
```

If all assertions pass, then your solution will be accepted.

### Example 1
> **Input**: nums = [3,2,2,3], val = 3
>
> **Output**: 2, nums = [2,2,_,_]
>
> **Explanation**: Your function should return `k = 2`, with the first two elements of `nums` being 2. It does not matter what you leave beyond the returned `k`.

### Example 2
> **Input**: nums = [0,1,2,2,3,0,4,2], val = 2
>
> **Output**: 5, nums = [0,1,4,0,3,_,_,_]
>
> **Explanation**: Your function should return `k = 5`, with the first five elements containing 0, 0, 1, 3, and 4. These five elements can be returned in any order, and the remaining positions do not matter.

## Constraints
- `0 <= nums.length <= 100`
- `0 <= nums[i] <= 50`
- `0 <= val <= 100`

<details>
<summary>💡 Hint 1</summary>
The array must be modified in-place, and the elements beyond the new length do not matter. We do not technically need to remove an element from the array; we only need a valid prefix.
</details>
<details>
<summary>💡 Hint 2</summary>
We can move all occurrences of `val` to the end of the array. Use two pointers.
</details>
<details>
<summary>💡 Hint 3</summary>
Another approach is to consider the removed elements invisible. In one pass, copy every visible element into the valid prefix in-place.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/remove-element/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/27/
