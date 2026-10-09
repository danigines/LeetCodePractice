# 76. Minimum Window Substring

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![sliding-window](../../src/images/badges/topics/sliding-window.svg)](../../src/md/topics/Sliding_Window.md)

Given two strings `s` and `t` of lengths `m` and `n`, respectively, return the minimum window substring of `s` such that every character in `t`, including duplicates, is included in the window. If there is no such substring, return the empty string `""`.

The test cases are generated so that the answer is unique.

### Example 1
> **Input**: s = "ADOBECODEBANC", t = "ABC"
>
> **Output**: "BANC"
>
> **Explanation**: The minimum window substring `"BANC"` includes `"A"`, `"B"`, and `"C"` from `t`.

### Example 2
> **Input**: s = "a", t = "a"
>
> **Output**: "a"
>
> **Explanation**: The entire string `s` is the minimum window.

### Example 3
> **Input**: s = "a", t = "aa"
>
> **Output**: ""
>
> **Explanation**: Both `"a"` characters from `t` must be included. Since the largest window of `s` contains only one `"a"`, return an empty string.

## Constraints
- `m == s.count`
- `n == t.count`
- `1 <= m, n <= 10⁵`
- `s` and `t` consist of uppercase and lowercase English letters.

## Follow-up
Could you find an algorithm that runs in `O(m + n)` time?

<details>
<summary>💡 Hint 1</summary>
Use two pointers to create a window in `s` that contains all the characters from `t`.
</details>
<details>
<summary>💡 Hint 2</summary>
Expand the right pointer until all the characters of `t` are covered.
</details>
<details>
<summary>💡 Hint 3</summary>
Once all the characters are covered, move the left pointer while ensuring they remain covered to minimize the window size.
</details>
<details>
<summary>💡 Hint 4</summary>
Continue expanding and contracting the window until the right pointer reaches the end of `s`.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/minimum-window-substring/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/76/
