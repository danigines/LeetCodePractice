# 6. Zigzag Conversion

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)

The string `"PAYPALISHIRING"` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
```text
P   A   H   N
A P L S I I G
Y   I   R
```
And then read line by line: `"PAHNAPLSIIGYIR"`

Write the code that will take a string and make this conversion given a number of rows:

> string convert(string s, int numRows);


### Example 1
> **Input**: s = "PAYPALISHIRING", numRows = 3
> 
> **Output**: "PAHNAPLSIIGYIR"

### Example 2
> **Input**: s = "PAYPALISHIRING", numRows = 4
> 
> **Output**: "PINALSIGYAHRPI"
> 
> **Explanation**: 
> ``` text
> P     I    N
> A   L S  I G
> Y A   H R
> P     I
> ```
### Example 3
> **Input**: s = "A", numRows = 1
> 
> **Output**: "A"

## Constraint
- `1 <= s.length <= 1000`
- `s` consists of English letters (lower-case and upper-case), `','` and `'.'`
- `1 <= numRows <= 1000`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/zigzag-conversion/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/6/
