# 4. Median of Two Sorted Arrays

![Hard](../../src/images/badges/difficulty/hard.svg)
![Array](../../src/images/badges/topics/array.svg)
![Binary-Search](../../src/images/badges/topics/binary-search.svg)
![DivideAndConquer](../../src/images/badges/topics/divide-and-conquer.svg)

Given two sorted arrays `nums1` and `nums2` of sizes `m` and `n`, return the median of the two sorted arrays.

The overall runtime complexity should be `O(log(m + n))`.

### Example 1
> **Input**: 
> 
> **Output**: 2.00000
> 
> **Explanation**: merged array = [1,2,3] and median is 2.

### Example 2
> **Input**: nums1 = [1,2], nums2 = [3,4]
> 
> **Output**: 2.50000
> 
> **Explanation**: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

### Constraints
- `nums1.length == m`
- `nums2.length == n`
- `0 <= m <= 1000`
- `0 <= n <= 1000`
- `1 <= m + n <= 2000`
- `-10^6 <= nums1[i], nums2[i] <= 10^6`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/median-of-two-sorted-arrays/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/4/
