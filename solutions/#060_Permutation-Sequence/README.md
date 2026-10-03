# 60. Permutation Sequence

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![math](../../src/images/badges/topics/math.svg)](../../src/md/topics/Math.md)
[![recursion](../../src/images/badges/topics/recursion.svg)](../../src/md/topics/Recursion.md)

The set `[1, 2, 3, ..., n]` has `n!` unique permutations.

For `n = 3`, listing them in lexicographical order produces:

1. `"123"`
2. `"132"`
3. `"213"`
4. `"231"`
5. `"312"`
6. `"321"`

Given `n` and `k`, return the `k`th permutation sequence.

### Example 1
> **Input**: n = 3, k = 3
>
> **Output**: "213"

### Example 2
> **Input**: n = 4, k = 9
>
> **Output**: "2314"

### Example 3
> **Input**: n = 3, k = 1
>
> **Output**: "123"

## Constraints
- `1 <= n <= 9`
- `1 <= k <= n!`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/permutation-sequence/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/60/
