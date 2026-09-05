# 21. Merge Two Sorted Lists

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![linked-list](../../src/images/badges/topics/linked-list.svg)](../../src/md/topics/Linked_List.md)
[![recursion](../../src/images/badges/topics/recursion.svg)](../../src/md/topics/Recursion.md)

You are given the heads of two **sorted** linked lists `list1` and `list2`.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return _the head of the merged linked list_.

### Example 1
![src](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)

> **Input**: list1 = [1,2,4], list2 = [1,3,4]
>
> **Output**: [1,1,2,3,4,4]

### Example 2
> **Input**: list1 = [], list2 = []
>
> **Output**: []

### Example 3
> **Input**: list1 = [], list2 = [0]
>
> **Output**: [0]

## Constraints
- The number of nodes in both lists is in the range `[0, 50]`.
- `-100 <= Node.val <= 100`
- Both `list1` and `list2` are sorted in non-decreasing order.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/merge-two-sorted-lists/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/21/
