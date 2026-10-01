# 56. Merge Intervals

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![quick-sort](../../src/images/badges/topics/quick-sort.svg)](../../src/md/topics/Quick_Sort.md)
[![sorting](../../src/images/badges/topics/sorting.svg)](../../src/md/topics/Sorting.md)

Given an array of intervals where `intervals[i] = [startᵢ, endᵢ]`, merge all overlapping intervals and return the non-overlapping intervals that cover every interval in the input.

### Example 1
> **Input**: intervals = [[1,3],[2,6],[8,10],[15,18]]
>
> **Output**: [[1,6],[8,10],[15,18]]
>
> **Explanation**: Intervals `[1,3]` and `[2,6]` overlap, so they merge into `[1,6]`.

### Example 2
> **Input**: intervals = [[1,4],[4,5]]
>
> **Output**: [[1,5]]
>
> **Explanation**: Intervals `[1,4]` and `[4,5]` are considered overlapping.

### Example 3
> **Input**: intervals = [[4,7],[1,4]]
>
> **Output**: [[1,7]]
>
> **Explanation**: Intervals `[1,4]` and `[4,7]` are considered overlapping.

## Constraints
- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ <= endᵢ <= 10⁴`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/merge-intervals/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/56/
