# 29. Divide Two Integers

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![math](../../src/images/badges/topics/math.svg)](../../src/md/topics/Math.md)
[![bit-manipulation](../../src/images/badges/topics/bit-manipulation.svg)](../../src/md/topics/Bit_Manipulation.md)

Given two integers `dividend` and `divisor`, divide two integers **without** using multiplication, division, and mod operator.

The integer division should truncate toward zero, which means losing its fractional part. For example, `8.345` would be truncated to `8`, and `-2.7335` would be truncated to `-2`.

Return the _**quotient**_ after dividing `dividend` by `divisor`.

**Note:** Assume we are dealing with an environment that could only store integers within the **32-bit** signed integer range: `[−2³¹, 2³¹ − 1]`. For this problem, if the quotient is **strictly greater than** `2³¹ - 1`, then return `2³¹ - 1`, and if the quotient is **strictly less** than `−2³¹`, then return `−2³¹`.

### Example 1
> **Input**: dividend = 10, divisor = 3
>
> **Output**: 3
>
> **Explanation**: 10/3 = 3.33333... which is truncated to 3.

### Example 2
> **Input**: dividend = 7, divisor = -3
>
> **Output**: -2
>
> **Explanation**: 7/-3 = -2.33333... which is truncated to -2.

## Constraints
- `−2³¹ <= dividend, divisor <= 2³¹ − 1`
- `divisor != 0`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/divide-two-integers/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/29/
