# 19. Remove Nth Node From End of List

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![linked-list](../../src/images/badges/topics/linked-list.svg)](../../src/md/topics/Linked_List.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)

Given the `head` of a linked list, remove the `nᵗʰ` node from the end of the list and return its head.

## Example 1
![src](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)
### Example 1
> **Input**: head = [1,2,3,4,5], n = 2
> 
> **Output**: [1,2,3,5]

### Example 2
> **Input**: head = [1], n = 1
> 
> **Output**: []

### Example 3
> **Input**: head = [1,2], n = 1
> 
> **Output**: [1]
> 

## Constraints
- The number of nodes in the list is `sz`.
- `1 <= sz <= 30`
- `0 <= Node.val <= 100`
- `1 <= n <= sz`

**Follow-up**: Could you do this in one pass?

<details>
<summary>💡 Hint 1</summary>
Maintain two pointers and update one with a delay of n steps.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/19/
