## Explanation [_Optimal solution_]

Scan the text and pattern with two indices. A literal or `'?'` consumes one character from each. When we see `'*'`, remember its position and where its match starts in the text, initially allowing it to match nothing.

If later characters do not match, return to the most recent `'*'`, let it consume one more text character, and try the following pattern again:

``` swift
textAfterStar += 1
textIndex = textAfterStar
patternIndex = starIndex + 1
```

Only the most recent star is needed: once the pattern reaches a later star, changing an earlier star cannot help more than extending the later one. After the text is consumed, any remaining pattern characters must all be `'*'`.

``` text
s = "adceb", p = "*a*b"
first * → ""; match a
second * → "dce"; match b
result → true
```

### How to Recognize This Pattern

Consider **Greedy Two-Pointer Matching** when a wildcard can absorb an arbitrary-length sequence and a mismatch can be repaired by extending the last wildcard's match.

## Explanation [_Second solution_]

Dynamic programming tracks whether each pattern prefix matches the text prefix processed so far. Let `dp[j]` mean that the processed text matches the first `j` pattern characters.

- A literal or `'?'` uses the previous row's diagonal state, because both prefixes consume one character.
- A `'*'` either matches nothing (`dp[j - 1]` in the current row) or consumes the current text character (its old `dp[j]` from the previous row).

Leading stars may match the empty text, so their prefix states start as `true`. One array plus a saved diagonal value is enough; a full two-dimensional table is unnecessary.

The **Recursion** topic names another way to express the same matching decisions. Neither Swift file here uses recursion.

## Comparing solutions

| Aspect | Optimal solution: Greedy Backtracking | Second solution: Dynamic Programming |
|:-------|:------------------------------------:|:------------------------------------:|
| Advantages | Constant auxiliary state after byte conversion; usually advances quickly. | Directly models every prefix match. |
| Disadvantages | May retry a pattern suffix many times after a star. | Evaluates all prefix pairs. |
| When to use it | When minimizing extra state and typical-case work. | When a systematic recurrence is easier to prove. |
| Interview recommendation | Explain why retrying only the latest star is sufficient. | A reliable alternative when reasoning about prefix states. |

## Complexity comparison

Let `m = s.length` and `n = p.length`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Greedy Backtracking | `O(m × n)` worst case | `O(m + n)` in Swift | A star can cause repeated scans of a pattern suffix. UTF-8 byte arrays copy the inputs; the matching logic itself uses `O(1)` extra state. |
| Dynamic Programming | `O(m × n)` | `O(m + n)` in Swift | Every text/pattern prefix pair is evaluated once. The DP row uses `O(n)` space, and the byte arrays use `O(m + n)`. |
