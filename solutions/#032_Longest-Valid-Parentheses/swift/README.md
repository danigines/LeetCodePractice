## Explanation [_Optimal solution_]

We can find the longest valid substring using two counters and two directional scans.

During the left-to-right scan:

``` text
openCount  → number of "(" in the current segment
closeCount → number of ")" in the current segment
```

Whenever both counts are equal, the current segment is balanced and its length is `2 × closeCount`.

### Why reset when closing parentheses are greater?

For:

``` text
)()()
↑
```

the first `)` cannot be matched by anything that appears later. When `closeCount > openCount`, no valid substring can cross that position, so both counters are reset.

### Why is a second scan necessary?

A left-to-right scan cannot discard extra opening parentheses at the end:

``` text
(()
```

The counters finish as:

``` text
openCount = 2
closeCount = 1
```

They never become equal after the valid `"()"` suffix is formed.

Scanning from right to left solves the symmetric case. In that direction, we reset when `openCount > closeCount`.

### How do both scans work together?

- Left to right detects segments blocked by unmatched `)`.
- Right to left detects segments blocked by unmatched `(`.
- Equal counters identify a complete valid segment.

Only counters and the best length are stored, so no auxiliary collection is required.

### Why iterate through UTF-8?

The input contains only `(` and `)`, which are single-byte ASCII characters. Iterating through `s.utf8` is safe here and avoids creating a character array.

### How to Recognize This Pattern

Think of **Bidirectional Balance Counting** when:

- the input contains only two complementary symbols
- unmatched symbols divide the input into independent segments
- balance can be checked with counters
- constant auxiliary space is desired

## Explanation [_Second solution_]

The stack solution stores indices of unmatched opening parentheses. It begins with `-1`, which represents the boundary before the string starts.

``` text
indices = [-1]
```

When `(` appears, its index is pushed. When `)` appears, one opening index is removed.

If the stack still contains a boundary, the valid substring ending at the current index has length:

``` swift
index - boundary
```

If the stack becomes empty, the current `)` is unmatched. Its index becomes the new boundary because no valid substring can cross it.

### Example

For `")()())"`:

``` text
index 0: unmatched ")" → new boundary 0
index 2: matched "()"  → length 2
index 4: matched "()()" → length 4
index 5: unmatched ")" → new boundary 5
```

The longest valid length is `4`.

### What changes compared to the optimal solution?

Both solutions run in linear time.

The stack solution needs only one scan and makes the substring boundaries explicit, but it can store up to `n` indices. The counter solution uses two scans to reduce auxiliary space to constant size.

## Comparing solutions

| Aspect | Optimal solution: Two Counter Scans | Second solution: Index Stack |
|:-------|:-----------------------------------:|:----------------------------:|
| Advantages | Linear time with constant auxiliary space. | One pass and explicit valid-substring boundaries. |
| Disadvantages | Requires understanding why both directions are necessary. | Uses linear auxiliary space in the worst case. |
| When to use it | When memory usage should be minimized. | When a stack-based boundary model is easier to explain. |
| Interview recommendation | Strong optimal solution after explaining the symmetry. | Excellent first solution because it is intuitive and reliable. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Two Counter Scans | `O(n)` | `O(1)` | The string is scanned twice while storing only counters and the maximum length. |
| Index Stack | `O(n)` | `O(n)` | Every character is processed once, and the stack may store every opening-parenthesis index. |
