# 72. Edit Distance

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![dynamic-programming](../../src/images/badges/topics/dynamic-programming.svg)](../../src/md/topics/Dynamic_Programming.md)

Given two strings `word1` and `word2`, return the minimum number of operations required to convert `word1` into `word2`.

The permitted operations are:

- Insert one character.
- Delete one character.
- Replace one character.

### Example 1
> **Input**: word1 = "horse", word2 = "ros"
>
> **Output**: 3
>
> **Explanation**:
>
> ``` text
> horse → rorse  (replace "h" with "r")
> rorse → rose   (delete "r")
> rose → ros     (delete "e")
> ```

### Example 2
> **Input**: word1 = "intention", word2 = "execution"
>
> **Output**: 5
>
> **Explanation**:
>
> ``` text
> intention → inention  (delete "t")
> inention → enention   (replace "i" with "e")
> enention → exention   (replace "n" with "x")
> exention → exection   (replace "n" with "c")
> exection → execution  (insert "u")
> ```

## Constraints
- `0 <= word1.count, word2.count <= 500`
- `word1` and `word2` contain only lowercase English letters.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/edit-distance/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/72/
