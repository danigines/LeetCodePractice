## Explanation [_Optimal solution_]

Start with `"1"` and generate one term at a time. Each new term describes the consecutive groups in the previous term.

``` text
"1" → "11" → "21" → "1211" → "111221"
```

For `"111221"`, the groups are `"111"`, `"22"`, and `"1"`, so the next term is `"312211"`.

### How is one term generated?

Scan the previous term from left to right. At each position, advance `end` until the digit changes. Then append the run length followed by that digit:

``` swift
next.append(contentsOf: String(end - index).utf8)
next.append(digit)
index = end
```

`index` jumps to the start of the next group, so every digit in the previous term is processed once.

### Why use UTF-8 bytes?

Every term contains only ASCII digits. A byte array allows simple integer indexing and avoids Swift's variable-width `String.Index` operations. Encoding the count as a string also handles a run longer than nine digits without special cases.

### Why is the iterative version preferred?

The loop starts at term `1` and repeats the transformation exactly `n - 1` times. It keeps only the current term and the next one, and it answers the problem's iterative follow-up directly.

### How to Recognize This Pattern

Think of **Run-Length Encoding** when:

- consecutive equal values form meaningful groups
- each group is replaced by its count and value
- the output of one transformation becomes the next input
- no earlier terms are needed once the next term is built

## Explanation [_Second solution_]

The recursive version follows the definition literally: compute `countAndSay(n - 1)` first, then encode that result. The base case returns `"1"`.

``` text
countAndSay(4)
  → encode(countAndSay(3))
  → encode("21")
  → "1211"
```

It uses the same consecutive-group scan as the iterative version, but stores the recursive calls on the stack.

### What changes compared to the optimal solution?

Both versions create the same sequence and process the characters of each term. The iterative version avoids recursion depth and keeps control of memory usage more explicit; the recursive version mirrors the mathematical recurrence more closely.

## Comparing solutions

| Aspect | Optimal solution: Iterative RLE | Second solution: Recursive RLE |
|:-------|:-------------------------------:|:------------------------------:|
| Advantages | Directly satisfies the follow-up and avoids a call stack. | Closely reflects the recurrence in the statement. |
| Disadvantages | Requires an outer loop over terms. | Adds recursion frames and character-array conversion. |
| When to use it | When generating terms efficiently and predictably. | When emphasizing the recursive definition. |
| Interview recommendation | Preferred for the iterative follow-up. | A natural starting point before removing recursion. |

## Complexity comparison

Let `n` be the requested term number, `Lᵢ` the length of term `i`, `S = L₁ + ... + Lₙ`, and `Lmax` the longest term generated.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iterative RLE | `O(S)` | `O(Lmax)` | Each term is scanned once to build the next; only the current and next terms are held. |
| Recursive RLE | `O(S)` | `O(Lmax + n)` | Each term is encoded once; the current term, its output, and up to `n` recursion frames are held. |
