## Explanation [_Optimal solution_]

Maintain a sliding window and two frequency arrays:

- `needed` stores how many times each character appears in `t`.
- `window` stores how many times each character appears in the current window.
- `matched` counts how many required character occurrences are currently covered, including duplicates.

Expand the right boundary. A new character increases `matched` only when its count does not exceed the required count.

Once `matched == target.count`, the window is valid. Record it if it is the shortest found, then move the left boundary until removing a required occurrence makes the window invalid again.

``` swift
for right in source.indices {
    let rightCharacter = Int(source[right])
    window[rightCharacter] += 1

    if window[rightCharacter] <= needed[rightCharacter] {
        matched += 1
    }

    while matched == target.count {
        let windowLength = right - left + 1

        if windowLength < bestLength {
            bestStart = left
            bestLength = windowLength
        }

        let leftCharacter = Int(source[left])

        if window[leftCharacter] <= needed[leftCharacter] {
            matched -= 1
        }

        window[leftCharacter] -= 1
        left += 1
    }
}
```

The constraints limit the input to English letters, so UTF-8 bytes can be indexed safely and fixed-size frequency arrays avoid repeated hash-table lookups.

### How to Recognize This Pattern

Consider a **Variable-Size Sliding Window** when a contiguous range must contain a required multiset and a valid range can be minimized by advancing its left boundary.

## Explanation [_Second solution_]

Try every possible starting position. For each start, expand the end of the substring and update its character frequencies until all occurrences required by `t` are covered.

The first valid window for a fixed start is its shortest one, so stop expanding that start and compare it with the best result.

``` swift
for start in source.indices {
    var window: [Character: Int] = [:]
    var matched = 0

    for end in start..<source.count {
        let character = source[end]
        window[character, default: 0] += 1

        if window[character, default: 0] <= needed[character, default: 0] {
            matched += 1
        }

        if matched == target.count {
            // Compare this window and stop expanding this start.
            break
        }
    }
}
```

This approach is direct, but rebuilding and expanding a window from every starting position repeats work that the sliding window avoids.

## Comparing solutions

| Aspect | Optimal solution: Sliding Window | Second solution: Expansion from Every Start |
|:-------|:--------------------------------:|:-------------------------------------------:|
| Advantages | Meets the linear-time follow-up and handles duplicates efficiently. | Closely follows the definition of testing candidate substrings. |
| Disadvantages | Requires precise frequency updates when shrinking the window. | Reprocesses the same characters from many starting positions. |
| When to use it | When the input can be large and a linear solution is required. | As a baseline for understanding why overlapping searches should be reused. |
| Interview recommendation | Preferred after defining the validity invariant for the window. | Explain briefly, then optimize it to the sliding-window solution. |

## Complexity comparison

Let `m` be the number of characters in `s`, `n` the number of characters in `t`, and `k` the number of distinct characters tracked by the frequency table.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Sliding Window | `O(m + n)` | `O(m + n)` | Both strings are converted to UTF-8 byte arrays for integer indexing, and each byte of `s` enters and leaves the window at most once; the fixed frequency arrays use `O(1)` space. |
| Expansion from Every Start | `O(m² + n)` | `O(m + n + k)` | Up to `m` starting positions each scan the remaining characters, while character arrays and a frequency dictionary are stored. |
