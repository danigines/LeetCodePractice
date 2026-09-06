# 26. Remove Duplicates from Sorted Array

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)

Given an integer array `nums` sorted in **non-decreasing order**, remove the duplicates [in-place](https://en.wikipedia.org/wiki/In-place_algorithm) such that each unique element appears only **once**. The **relative order** of the elements should be kept the **same**.

Consider the number of unique elements in `nums` to be `k`. After removing duplicates, return the number of unique elements `k`.

The first `k` elements of `nums` should contain the unique numbers in **sorted order. The remaining elements beyond index `k - 1` can be ignored.

### Custom Judge

The judge will test your solution with the following code:

```text
int[] nums = [...]; // Input array
int[] expectedNums = [...]; // The expected answer with correct length

int k = removeDuplicates(nums); // Calls your implementation

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
```

If all assertions pass, then your solution will be **accepted**.

### Example 1
> **Input**: nums = [1,1,2]
>
> **Output**: 2, nums = [1,2,_]
>
> **Explanation**: Your function should return `k = 2`, with the first two elements of `nums` being 1 and 2 respectively. It does not matter what you leave beyond the returned `k` (hence they are underscores).

### Example 2
> **Input**: nums = [0,0,1,1,1,2,2,3,3,4]
>
> **Output**: 5, nums = [0,1,2,3,4,_,_,_,_,_]
>
> **Explanation**: Your function should return `k = 5`, with the first five elements of `nums` being 0, 1, 2, 3, and 4 respectively. It does not matter what you leave beyond the returned `k` (hence they are underscores).

## Constraints
- `1 <= nums.length <= 3 × 10⁴`
- `-100 <= nums[i] <= 100`
- `nums` is sorted in **non-decreasing** order.

<details>
<summary>💡 Hint 1</summary>
In this problem, the key point to focus on is the input array being sorted. As far as duplicate elements are concerned, what is their positioning in the array when the given array is sorted? If we know the position of one of the elements, do we also know the positioning of all the duplicate elements?
</details>
<details>
<summary>💡 Hint 2</summary>
We need to modify the array in-place, and the size of the final array would potentially be smaller than the size of the input array. Therefore, we ought to use a two-pointer approach: one pointer to track the current element in the original array and another for the unique elements.
</details>
<details>
<summary>💡 Hint 3</summary>
Once an element is encountered, bypass its duplicates and move on to the next unique element.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/26/
