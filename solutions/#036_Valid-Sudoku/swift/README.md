## Explanation [_Optimal solution_]

Every filled cell belongs to exactly three groups: one row, one column, and one `3 x 3` box. The board is invalid as soon as a digit appears twice in any of those groups.

We represent the digits `1...9` with the lowest nine bits of an integer:

``` text
digit: 1 2 3 4 5 6 7 8 9
bit:   0 1 2 3 4 5 6 7 8
```

For example, digit `5` uses `1 << 4`.

### How do masks detect duplicates?

Each row, column, and box has its own integer mask. A bitwise AND checks whether a digit's bit is already active:

``` swift
if rowMasks[row] & bit != 0 {
    return false
}
```

If the bit is absent, bitwise OR records it:

``` swift
rowMasks[row] |= bit
```

The same check and update are applied to the corresponding column and box.

### How is the box index calculated?

Integer division groups rows and columns into sections `0`, `1`, and `2`:

``` swift
let box = (row / 3) * 3 + column / 3
```

The boxes are numbered as follows:

``` text
0 1 2
3 4 5
6 7 8
```

### Why can empty cells be ignored?

The problem asks only whether the currently filled cells violate a Sudoku rule. A `.` contributes no digit, so it does not change any mask.

The algorithm validates consistency; it does not determine whether the board has a solution.

### Why use `asciiValue`?

The constraints guarantee ASCII digits. Subtracting the ASCII value of `"1"` converts characters `1...9` into bit positions `0...8` without creating temporary strings.

### How to Recognize This Pattern

Think of **Bitmask Membership Tracking** when:

- values come from a small fixed domain
- membership must be checked across multiple groups
- duplicates make the input immediately invalid
- each group can fit inside the bits of one integer

## Explanation [_Second solution_]

The second solution follows the same single traversal but stores actual characters in sets.

``` text
rows[4]    → digits already seen in row 4
columns[7] → digits already seen in column 7
boxes[3]   → digits already seen in box 3
```

Before inserting a filled value, we check all three corresponding sets. If any one already contains it, the board is invalid.

### What changes compared to the optimal solution?

Both solutions inspect every cell once and stop immediately when they find a duplicate.

The set solution is more explicit and readable, but hash sets have more storage and hashing overhead. Bitmasks encode the same membership information compactly with integer operations.

## Comparing solutions

| Aspect | Optimal solution: Bitmasks | Second solution: Hash Sets |
|:-------|:--------------------------:|:--------------------------:|
| Advantages | Compact storage and fast integer operations. | Clear representation of the Sudoku rules. |
| Disadvantages | Requires understanding bit positions and masks. | Uses hash-table storage and hashing operations. |
| When to use it | When the value domain is small and fixed. | When readability and direct membership checks are preferred. |
| Interview recommendation | Strong optimized solution after explaining the encoding. | Excellent first solution because it maps directly to the rules. |

## Complexity comparison

Let `n` be the width of the board; for this problem, `n = 9`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Bitmasks | `O(n²)` | `O(n)` | Every cell is visited once, and one fixed-size mask is stored per row, column, and box. |
| Hash Sets | `O(n²)` | `O(n²)` | Every cell is visited once, while the sets may collectively store every filled value. |

Because Sudoku is always `9 x 9`, both bounds are constant for this specific problem.
