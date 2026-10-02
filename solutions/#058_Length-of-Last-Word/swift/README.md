## Explanation [_Optimal solution_]

Only the final word matters, so traverse the string from right to left:

1. Ignore trailing spaces while the length is zero.
2. Count every character in the last word.
3. Stop at the first space after counting begins.

``` swift
for byte in s.utf8.reversed() {
    if byte == space {
        if length > 0 { break }
    } else {
        length += 1
    }
}
```

The constraints guarantee only English letters and spaces, so iterating through UTF-8 bytes counts each letter exactly once and avoids Swift string-index overhead.

### How to Recognize This Pattern

Consider **Reverse Traversal** when the answer depends only on the last meaningful segment and any trailing separators can be skipped.

## Explanation [_Second solution_]

Scan from left to right while tracking the current word length. A space completes the current word, so save its length and reset the counter. If the string ends with a word, return the current counter; otherwise, return the last saved length.

``` swift
if character == " " {
    if currentLength > 0 {
        lastWordLength = currentLength
        currentLength = 0
    }
} else {
    currentLength += 1
}
```

This version also uses constant auxiliary space, but it always scans the complete string even when the last word is short.

## Comparing solutions

| Aspect | Optimal solution: Reverse Traversal | Second solution: Forward Traversal |
|:-------|:-----------------------------------:|:----------------------------------:|
| Advantages | Stops immediately after finding the complete last word. | Processes the string in its natural reading order. |
| Disadvantages | Uses the ASCII-space byte value under the stated constraints. | Examines every character and maintains two counters. |
| When to use it | When only the final token is needed. | When word information is naturally processed as it arrives. |
| Interview recommendation | Preferred; explain how trailing spaces are skipped. | A simple alternative with the same worst-case bounds. |

## Complexity comparison

Let `n` be the number of characters in `s`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Reverse Traversal | `O(n)` | `O(1)` | In the worst case, the traversal examines the entire string and stores only the current length. |
| Forward Traversal | `O(n)` | `O(1)` | Every character is examined once, while only the current and last word lengths are stored. |
