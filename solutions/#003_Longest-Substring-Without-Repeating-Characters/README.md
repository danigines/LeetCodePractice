# 3. Longest Substring Without Repeating Characters

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![sliding-window](../../src/images/badges/topics/sliding-window.svg)](../../src/md/topics/Sliding_Window.md)

Given a string `s`, find the length of the longest substring without repeating characters.

A substring is a contiguous sequence of characters within the original string.

### Example 1
> **Input**: s = "abcabcbb"
> 
> **Output**: 3
> 
> **Explanation**: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.

### Example 2
> **Input**: s = "bbbbb"
> 
> **Output**: 1
> 
> **Explanation**: The answer is "b", with the length of 1.

### Example 3
> **Input**: s = "pwwkew"
> 
> **Output**: 3
> 
> **Explanation**: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

### Constraints
- `0 <= s.count <= 10^5`
- `s` consists of English letters, digits, symbols, and spaces.

<details>
<summary>💡 Hint 1</summary>
There are less than 100 unique characters. We can check all substrings with length at most 100 for example. This is a good enough approximation.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/3/
