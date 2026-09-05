# 23. Merge k Sorted Lists

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![linked-list](../../src/images/badges/topics/linked-list.svg)](../../src/md/topics/Linked_List.md)
[![divide-and-conquer](../../src/images/badges/topics/divide-and-conquer.svg)](../../src/md/topics/Divide_and_Conquer.md)
[![heap-priority-queue](../../src/images/badges/topics/heap-priority-queue.svg)](../../src/md/topics/Heap_Priority_Queue.md)
[![merge-sort](../../src/images/badges/topics/merge-sort.svg)](../../src/md/topics/Merge_Sort.md)

You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

### Example 1
> **Input**: lists = [[1,4,5],[1,3,4],[2,6]]
>
> **Output**: [1,1,2,3,4,4,5,6]
>
> **Explanation**: The linked-lists are:
> ```text
> [
>   1->4->5,
>   1->3->4,
>   2->6
> ]
> ```
> merging them into one sorted linked list:
> ```text
> 1->1->2->3->4->4->5->6
> ```

### Example 2
> **Input**: lists = []
>
> **Output**: []

### Example 3
> **Input**: lists = [[]]
>
> **Output**: []

## Constraints
- `k == lists.length`
- `0 <= k <= 10⁴`
- `0 <= lists[i].length <= 500`
- `-10⁴ <= lists[i][j] <= 10⁴`
- `lists[i]` is sorted in ascending order.
- The sum of `lists[i].length` will not exceed `10⁴`.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/merge-k-sorted-lists/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/23/
