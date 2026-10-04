# 65. Valid Number

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)

Given a string `s`, return whether it represents a valid number.

A valid number is an integer or decimal followed by an optional exponent:

- An **integer** has an optional sign (`+` or `-`) followed by one or more digits.
- A **decimal** has an optional sign followed by digits and a dot, digits on both sides of a dot, or a dot followed by digits.
- An **exponent** uses `e` or `E` followed by an integer.

Examples of valid numbers include `"2"`, `"-0.1"`, `"4."`, `"-.9"`, `"2e10"`, and `"3e+7"`.

Examples of invalid numbers include `"abc"`, `"1e"`, `"e3"`, `"99e2.5"`, `"--6"`, and `"95a54e53"`.

### Example 1
> **Input**: s = "0"
>
> **Output**: true

### Example 2
> **Input**: s = "e"
>
> **Output**: false

### Example 3
> **Input**: s = "."
>
> **Output**: false

## Constraints
- `1 <= s.count <= 20`
- `s` contains only English letters, digits (`0-9`), plus (`+`), minus (`-`), or dot (`.`).

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/valid-number/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/65/
