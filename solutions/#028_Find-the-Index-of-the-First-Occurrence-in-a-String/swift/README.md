## Explanation [_Optimal solution_]

The Knuth-Morris-Pratt algorithm, or **KMP**, searches for `needle` without restarting every comparison after a mismatch.

For:

``` text
haystack = "sadbutsad"
needle   = "sad"
```

the first three characters match, so the result is index `0`.

The important improvement appears when a partial match fails. Instead of moving all the way back to the beginning of `needle`, KMP uses information about the pattern itself.

### What is the Prefix Table?

For each position in `needle`, the prefix table stores the length of the longest proper prefix that is also a suffix.

For:

``` text
pattern = "ababaca"
```

the table is:

``` text
character: a b a b a c a
prefix:    0 0 1 2 3 0 1
```

At the second `b`, for example, the substring `"abab"` has `"ab"` as both a prefix and suffix, so its stored value is `2`.

### How does the table avoid repeated work?

When a mismatch occurs after matching part of the pattern, we already know that a suffix of the matched part equals a prefix of `needle`.

Instead of moving `textIndex` backward, we move only `patternIndex`:

``` swift
patternIndex = prefixTable[patternIndex - 1]
```

The text is never re-read from an earlier position.

### When is the match complete?

When `patternIndex` reaches the length of `needle`, all its characters have matched.

Because `textIndex` already points one position after the match, its starting index is:

``` swift
textIndex - pattern.count
```

### Why convert strings to character arrays?

Swift `String` indices are not integers because a character may contain multiple Unicode scalars.

Converting both strings to `[Character]` provides clear constant-time integer indexing. This uses linear memory but keeps the algorithm and its indexing behavior predictable.

### How to Recognize This Pattern

Think of **KMP String Matching** when:

- one string must be located inside another
- the pattern may contain repeated prefixes
- restarting after every mismatch would repeat comparisons
- linear search time is required

## Explanation [_Second solution_]

The direct solution treats every possible starting position in `haystack` as a candidate.

For each start, it compares the characters of `needle` from left to right:

``` text
haystack: l e e t c o d e
needle:   l e e t o
start:    0
```

The first four characters match, but `c != o`, so that candidate fails. The algorithm then tries the next starting position.

It returns immediately when every pattern character matches, guaranteeing the first occurrence.

### What changes compared to the optimal solution?

The direct solution is shorter and easier to understand, but it can compare the same text characters repeatedly.

KMP preprocesses `needle` and uses its prefix table to avoid moving backward through `haystack`, guaranteeing linear time.

## Comparing solutions

| Aspect | Optimal solution: KMP | Second solution: Direct Search |
|:-------|:---------------------:|:------------------------------:|
| Advantages | Guaranteed linear time and no repeated backward traversal of the text. | Simple, intuitive, and easy to implement correctly. |
| Disadvantages | Requires preprocessing and understanding the prefix table. | May repeat many comparisons for overlapping candidates. |
| When to use it | When inputs are large or patterns contain repeated prefixes. | When inputs are small and implementation simplicity is preferred. |
| Interview recommendation | Preferred when an efficient string-matching algorithm is expected. | Present first if allowed, then optimize to KMP. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| KMP | `O(n + m)` | `O(n + m)` | `n` is the length of `haystack` and `m` is the length of `needle`. Each character is processed a constant number of times; the Swift character arrays and prefix table use linear space. |
| Direct Search | `O((n - m + 1) × m)` | `O(n + m)` | `n` and `m` are the text and pattern lengths. Up to `n - m + 1` starts compare as many as `m` characters; both strings are stored as character arrays. |
