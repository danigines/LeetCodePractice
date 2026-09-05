## Explanation [_Optimal solution_]

Manacher's Algorithm finds the longest palindromic substring in linear time by reusing information from palindromes already discovered.

### Why transform the string?

Palindromes may have odd or even length:

```text
"aba"  → odd
"abba" → even
```

We insert `#` separators so both types have a single-character center:

```text
aba  → #a#b#a#
abba → #a#b#b#a#
```

The `^` and `$` sentinels mark the boundaries and simplify expansion checks.

### What does `radius` store?

For every transformed position:

``` swift
radius[index]
```

stores how far its palindrome extends around that center.

The algorithm also tracks the palindrome that currently reaches farthest to the right. If a new index lies inside that boundary, its mirrored position can provide a known initial radius.

### Why does the mirror help?

Characters inside a known palindrome are symmetric. Part of the palindrome around the current index may therefore already be guaranteed by the palindrome around its mirror.

We reuse that known distance and expand only beyond it, avoiding repeated comparisons.

### How to Recognize Manacher's Algorithm

Consider **Manacher's Algorithm** when:

- the problem specifically involves palindromic substrings
- the longest palindrome must be found
- quadratic expansion is not fast enough
- strict `O(n)` time is important

It is a specialized algorithm; Expand Around Center is usually easier unless linear performance is required.

## Explanation [_Second solution_]

Every palindrome has a center. For each string position, we expand around:

- one character for odd-length palindromes
- the gap between two characters for even-length palindromes

Expansion continues while both indices are valid and their characters match. Whenever a longer palindrome is found, we store its start and length.

### What changes compared to the optimal solution?

Expand Around Center is much simpler, but it may compare the same characters from many different centers. Manacher avoids this repeated work by storing and mirroring known radii.

## Comparing solutions

| Aspect | Optimal solution: Manacher | Second solution: Expand Around Center |
|:-------|:--------------------------:|:-------------------------------------:|
| Advantages | Strictly linear time and reuse of previously calculated palindrome information. | Simple, intuitive, and easy to implement correctly. |
| Disadvantages | Specialized and considerably more complex. | May expand across most of the string from every center. |
| When to use it | When strict linear performance is required for large strings. | When clarity is preferred and quadratic time is acceptable. |
| Interview recommendation | Explain it only when linear time is expected or the algorithm is already familiar. | Usually preferred in interviews because it balances clarity and acceptable performance. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Manacher | `O(n)` | `O(n)` | `n` is the number of characters in `s`. Known palindrome radii prevent repeated expansion, while the transformed string and radius array use linear space. |
| Expand Around Center | `O(n²)` | `O(n)` | `n` is the number of characters. There are `O(n)` centers and each may expand `O(n)` positions; `Array(s)` uses linear space. |
