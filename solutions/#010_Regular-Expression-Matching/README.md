# 10. Regular Expression Matching

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![recursion](../../src/images/badges/topics/recursion.svg)](../../src/md/topics/Recursion.md)

Given an input string `s` and a pattern `p`, implement regular expression matching with support for `'.'` and `'*'`.

- `'.'` matches any single character.
- `'*'` matches zero or more occurrences of the preceding element.

Return a boolean indicating whether the matching covers the entire input string (not partial).

### Example 1
> **Input**: s = "aa", p = "a"
> 
> **Output**: false
> 
> **Explanation**: "a" does not match the entire string "aa".

### Example 2
> **Input**: s = "aa", p = "a*"
> 
> **Output**: true
> 
> **Explanation**: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".

### Example 3
> **Input**: s = "ab", p = ".*"
> 
> **Output**: true
> 
> **Explanation**: ".*" means "zero or more (*) of any character (.)".

## Constraints
- `1 <= s.length <= 20`
- `1 <= p.length <= 20`
- `s` contains only lowercase English letters.
- `p` contains only lowercase English letters, `'.'`, and `'*'`.
- It is guaranteed for each appearance of the character `'*'`, there will be a previous valid character to match.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/regular-expression-matching/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/10/
