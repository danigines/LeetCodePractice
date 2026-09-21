## Explanation [_Optimal solution_]

Simulate the digit products of grade-school multiplication. If `num1` has `m` digits and `num2` has `n`, their product needs at most `m + n` positions.

For zero-based indices from the left, multiplying digits `i` and `j` contributes to position `i + j + 1` in that result array:

``` swift
product[i + j + 1] += firstDigit * secondDigit
```

After collecting all pairwise products, sweep from right to left. Keep each position's units digit and carry its tens to the preceding position. Skip one leading zero when present; if either input is `"0"`, return it before doing any work.

``` text
    123
  × 456
  -----
  56088
```

Using UTF-8 bytes is safe here because the inputs contain only ASCII digits. We convert **individual digits**, never the entire input, to integers.

### How to Recognize This Pattern

Use **digit-by-digit simulation** when a number may exceed the machine integer range but its arithmetic can be reproduced with bounded single-digit operations and carries.

## Explanation [_Second solution_]

This version mirrors handwritten multiplication more literally. For each digit of `num2`, starting at the units place, it builds a partial row from `num1`, shifts that row by its decimal position, and adds it into the running sum. Both rows and the running sum store digits in reverse order, so carries travel toward larger indices.

It is intuitive but repeats a digit-by-digit addition for every partial row.

## Comparing solutions

| Aspect | Optimal solution: Shared Result Array | Second solution: Partial Rows |
|:-------|:-------------------------------------:|:-----------------------------:|
| Advantages | Accumulates each digit product directly in its final column. | Closely follows handwritten multiplication. |
| Disadvantages | The `i + j + 1` offset needs explanation. | Rebuilds and adds a row for every multiplier digit. |
| When to use it | For a concise, efficient implementation. | When teaching the multiplication process step by step. |
| Interview recommendation | Preferred for simpler complexity and fewer moving parts. | Useful as an intuitive starting point. |

## Complexity comparison

Let `m = num1.length` and `n = num2.length`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Shared Result Array | `O(m × n)` | `O(m + n)` | Every digit pair is multiplied once; the product array and input byte arrays have linear size. |
| Partial Rows | `O(n × (m + n))` | `O(m + n)` | Each of `n` rows multiplies `m` digits and may add across up to `m + n` positions; only one row and the sum are retained. |
