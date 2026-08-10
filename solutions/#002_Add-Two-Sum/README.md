# 2. Add Two Numbers

![Medium](../../src/images/badges/difficulty/medium.svg)
![LinkedList](../../src/images/badges/topics/linked-list.svg)
![Math](../../src/images/badges/topics/math.svg)
![Recursion](../../src/images/badges/topics/recursion.svg)

You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

### Example 1
![src](https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg)
> **Input**: l1 = [2,4,3], l2 = [5,6,4]
> 
> **Output**: [7,0,8]
> 
> **Explanation**: 342 + 465 = 807.

### Example 2
> **Input**: l1 = [0], l2 = [0]
> 
> **Output**: [0]

### Example 3
> **Input**: [9,9,9,9,9,9,9], l2 = [9,9,9,9]
> 
> **Output**: [8,9,9,9,0,0,0,1]

### Constraints

- The number of nodes in each linked list is in the range `[1, 100]`.
- `0 <= Node.val <= 9`
- The input lists represent numbers without leading zeros.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/add-two-numbers/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/2/
