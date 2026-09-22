# 44. Wildcard Matching

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)
[![greedy](../../src/images/badges/topics/greedy.svg)](../../src/md/topics/Greedy.md)
[![recursion](../../src/images/badges/topics/recursion.svg)](../../src/md/topics/Recursion.md)

Given an input string `s` and a pattern `p`, determine whether the pattern matches the **entire** string. In the pattern, `'?'` matches exactly one character, while `'*'` matches any sequence of characters, including an empty sequence.

### Example 1
> **Input**: s = "aa", p = "a"
>
> **Output**: false
>
> **Explanation**: The pattern does not match the entire string.

### Example 2
> **Input**: s = "aa", p = "*"
>
> **Output**: true
>
> **Explanation**: `'*'` can match both characters.

### Example 3
> **Input**: s = "cb", p = "?a"
>
> **Output**: false
>
> **Explanation**: `'?'` matches `c`, but `a` does not match `b`.

## Constraints
- `0 <= s.length, p.length <= 2000`
- `s` contains only lowercase English letters.
- `p` contains only lowercase English letters, `'?'`, or `'*'`.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/wildcard-matching/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/44/
