## Explanation [_Optimal solution_]

Greedily select the largest consecutive group of words that fits in the next line. While choosing the group, reserve one mandatory space between adjacent words.

For a normal fully justified line, subtract the letters from `maxWidth` and distribute the available spaces across the gaps:

``` text
baseSpaces  = totalSpaces / gaps
extraSpaces = totalSpaces mod gaps
```

Every gap receives `baseSpaces`. The first `extraSpaces` gaps receive one additional space, which places the uneven remainder on the left.

``` swift
let totalSpaces = maxWidth - lettersLength
let gaps = wordCount - 1
let baseSpaces = totalSpaces / gaps
let extraSpaces = totalSpaces % gaps

for index in lineStart..<lineEnd {
    line += words[index]

    if index < lineEnd - 1 {
        let gapIndex = index - lineStart
        let spaces = baseSpaces + (gapIndex < extraSpaces ? 1 : 0)
        line += String(repeating: " ", count: spaces)
    }
}
```

For the last line or a one-word line, join words with one space and append all remaining spaces on the right.

### How to Recognize This Pattern

Consider **Greedy Packing with Deterministic Distribution** when each group must contain as many items as possible and leftover capacity follows a fixed allocation rule.

## Explanation [_Second solution_]

Maintain an explicit array containing the words selected for the current line. When the next word no longer fits, format the accumulated words and begin a new line.

A helper handles the two formatting cases:

- Left justification joins words with a single space and pads the right side.
- Full justification calculates the quotient and remainder of the available spaces across the gaps.

``` swift
if isLastLine || lineWords.count == 1 {
    let text = lineWords.joined(separator: " ")
    return text + String(repeating: " ", count: maxWidth - text.count)
}

let totalSpaces = maxWidth - lettersLength
let gaps = lineWords.count - 1
let baseSpaces = totalSpaces / gaps
let extraSpaces = totalSpaces % gaps
```

This version separates line collection from line formatting, which can make the responsibilities easier to test independently.

## Comparing solutions

| Aspect | Optimal solution: Index-Based Greedy | Second solution: Buffered Line Words |
|:-------|:------------------------------------:|:------------------------------------:|
| Advantages | Tracks each line with indices and avoids copying its words into another array. | Clearly separates greedy grouping from formatting. |
| Disadvantages | Selection and formatting logic share the same outer loop. | Temporarily stores the words belonging to the current line. |
| When to use it | When minimizing temporary storage while preserving direct control over ranges. | When readability and isolated formatting logic are priorities. |
| Interview recommendation | Preferred after explaining greedy grouping and the quotient/remainder spacing rule. | A clean alternative if helper-based organization is easier to communicate. |

## Complexity comparison

Let `C` be the total number of characters in the fully justified output, including spaces, and let `W` be `maxWidth`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Index-Based Greedy | `O(C)` | `O(W)` | Each word and each emitted space is processed once; excluding the returned lines, the current line contains at most `W` characters. |
| Buffered Line Words | `O(C)` | `O(W)` | Grouping and formatting process each output character once, while the current words and formatted line occupy at most one line of width `W`, excluding the answer. |
