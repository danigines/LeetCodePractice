# 49. Group Anagrams

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![hash-table](../../src/images/badges/topics/hash-table.svg)](../../src/md/topics/Hash_Table.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![sorting](../../src/images/badges/topics/sorting.svg)](../../src/md/topics/Sorting.md)

Given an array of strings `strs`, group the anagrams together. Return the groups in any order.

### Example 1
> **Input**: strs = ["eat","tea","tan","ate","nat","bat"]
>
> **Output**: [["bat"],["nat","tan"],["ate","eat","tea"]]
>
> **Explanation**: `"nat"` and `"tan"` contain the same letters, as do `"ate"`, `"eat"`, and `"tea"`. No other input word is an anagram of `"bat"`.

### Example 2
> **Input**: strs = [""]
>
> **Output**: [[""]]

### Example 3
> **Input**: strs = ["a"]
>
> **Output**: [["a"]]

## Constraints
- `1 <= strs.length <= 10⁴`
- `0 <= strs[i].length <= 100`
- Every string contains only lowercase English letters.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/group-anagrams/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/49/
