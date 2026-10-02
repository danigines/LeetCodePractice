# 57. Insert Interval

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)

You are given an array of non-overlapping intervals where `intervals[i] = [startᵢ, endᵢ]`, sorted in ascending order by `startᵢ`. You are also given another interval `newInterval = [start, end]`.

Two intervals overlap if they share at least one point.

Insert `newInterval` so that the result remains sorted and contains no overlapping intervals, merging intervals when necessary. You may return a new array instead of modifying `intervals` in-place.

### Example 1
> **Input**: intervals = [[1,3],[6,9]], newInterval = [2,5]
>
> **Output**: [[1,5],[6,9]]

### Example 2
> **Input**: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
>
> **Output**: [[1,2],[3,10],[12,16]]
>
> **Explanation**: The new interval `[4,8]` overlaps with `[3,5]`, `[6,7]`, and `[8,10]`.

## Constraints
- `0 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ <= endᵢ <= 10⁵`
- `intervals` is sorted by `startᵢ` in ascending order.
- `newInterval.length == 2`
- `0 <= start <= end <= 10⁵`

<details>
<summary>💡 Hint 1</summary>
The intervals are already sorted and do not overlap. Visualize them as line segments and identify the possible positions of the new interval.
</details>
<details>
<summary>💡 Hint 2</summary>
First append every interval that ends before the new interval begins. Then determine whether all intervals were consumed, the next interval lies completely after it, or an overlap begins.
</details>
<details>
<summary>💡 Hint 3</summary>
While intervals overlap, expand the new interval using the minimum start and maximum end. Append the merged interval once, followed by all remaining intervals.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/insert-interval/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/57/
