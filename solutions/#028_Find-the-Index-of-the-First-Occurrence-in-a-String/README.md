# 28. Find the Index of the First Occurrence in a String

[![easy](../../src/images/badges/difficulty/easy.svg)](../../src/md/difficulty/easy.md)
[![two-pointers](../../src/images/badges/topics/two-pointers.svg)](../../src/md/topics/Two_Pointers.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![string-matching](../../src/images/badges/topics/string-matching.svg)](../../src/md/topics/String_Matching.md)
[![z-algorithm](../../src/images/badges/topics/z-algorithm.svg)](../../src/md/topics/Z_Algorithm.md)
[![knuth-morris-pratt-algorithm](../../src/images/badges/topics/knuth-morris-pratt-algorithm.svg)](../../src/md/topics/Knuth_Morris_Pratt_Algorithm.md)
[![boyer-moore-string-search-algorithm](../../src/images/badges/topics/boyer-moore-string-search-algorithm.svg)](../../src/md/topics/Boyer_Moore_String_Search_Algorithm.md)

Given two strings `needle` and `haystack`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.

### Example 1
> **Input**: haystack = "sadbutsad", needle = "sad"
>
> **Output**: 0
>
> **Explanation**: "sad" occurs at index 0 and 6. The first occurrence is at index 0, so we return 0.

### Example 2
> **Input**: haystack = "leetcode", needle = "leeto"
>
> **Output**: -1
>
> **Explanation**: "leeto" did not occur in "leetcode", so we return -1.

## Constraints
- `1 <= haystack.length, needle.length <= 10⁴`
- `haystack` and `needle` consist of only lowercase English characters.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/28/
