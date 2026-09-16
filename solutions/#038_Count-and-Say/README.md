# 38. Count and Say

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)

The **count-and-say sequence** is a sequence of digit strings defined by the recursive formula:

- `countAndSay(1) = "1"`
- `countAndSay(n)` is the run-length encoding of `countAndSay(n - 1)`.

**Run-length encoding** (RLE) replaces each maximal group of consecutive identical characters with the group's length followed by its character. For example, `"3322251"` becomes `"23321511"` because its groups are `"33"`, `"222"`, `"5"`, and `"1"`.

Given a positive integer `n`, return the `n`th element of the count-and-say sequence.

### Example 1
> **Input**: n = 4
>
> **Output**: "1211"
>
> **Explanation**:
>
> ``` text
> countAndSay(1) = "1"
> countAndSay(2) = "11"
> countAndSay(3) = "21"
> countAndSay(4) = "1211"
> ```

### Example 2
> **Input**: n = 1
>
> **Output**: "1"
>
> **Explanation**: This is the base case.

## Constraints
- `1 <= n <= 30`

<details>
<summary>💡 Hint 1</summary>
Group consecutive equal digits and record each group as a pair containing its digit and count.
</details>
<details>
<summary>💡 Hint 2</summary>
Convert each pair into count followed by digit, then join the pieces to form the next term.
</details>
<details>
<summary>💡 Hint 3</summary>
Begin with `"1"` and repeat that grouping-and-encoding process `n - 1` times.
</details>

**Follow up:** Could you solve it iteratively?

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/count-and-say/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/38/
