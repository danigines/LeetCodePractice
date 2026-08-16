# 9. Palindrome Number

![Easy](../../src/images/badges/difficulty/easy.svg)
![Math](../../src/images/badges/topics/math.svg)

Given an integer `x`, return `true` if `x` is a **palindrome**, and `false` otherwise.

### Example 1
> **Input**: x = 121
> 
> **Output**: true
> 
> **Explanation**: `121` reads the same from left to right and from right to left.

### Example 2
> **Input**: x = -121
> 
> **Output**: false
> 
> **Explanation**: From left to right, it reads `-121`. From right to left, it becomes `121-`, so it is not a palindrome.

### Example 3
> **Input**: x = 10
> 
> **Output**: false
> 
> **Explanation**: Reading `10` from right to left gives `01`, so it is not a palindrome.

## Constraints
- `-2³¹ <= x <= 2³¹ - 1`

**Follow-up**:  Could you solve it without converting the integer to a string?

<details>
<summary>💡 Hint 1</summary>
Beware of overflow when you reverse the integer.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/palindrome-number/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/9/
