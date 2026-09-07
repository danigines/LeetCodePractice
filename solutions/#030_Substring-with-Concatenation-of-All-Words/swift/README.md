## Explanation [_Optimal solution_]

Every word has the same length, so `s` can be examined in word-sized chunks instead of one character at a time.

For:

``` text
s = "barfoothefoobarman"
words = ["foo", "bar"]
word length = 3
```

the chunks aligned at offset `0` are:

``` text
bar | foo | the | foo | bar | man
```

A sliding window tracks how many required words appear between `left` and `right`.

### Why are multiple offsets necessary?

A valid substring can begin at any character position. For words of length `3`, the possible chunk alignments begin at offsets `0`, `1`, and `2`.

Each alignment is processed independently:

``` swift
for offset in 0..<wordLength {
    var left = offset
    var right = offset
}
```

Together, these alignments cover every possible starting index.

### What happens when a word is not required?

An unknown word cannot belong to a valid concatenation. The current window is cleared, and its left boundary moves after that word.

``` swift
guard let allowedFrequency = requiredFrequency[word] else {
    windowFrequency.removeAll(keepingCapacity: true)
    wordsInWindow = 0
    left = right
    continue
}
```

### How are duplicate words handled?

The frequency dictionaries distinguish between having a word and having it the correct number of times.

If the newest word exceeds its allowed frequency, words are removed from the left until the window becomes valid again.

``` text
required: ["word": 1, "good": 1]
window:   word | good | good
                       ↑ extra
```

### When is an index added?

Once the window contains exactly `words.count` valid words, `left` is a valid starting index.

After recording it, one word is removed from the left so overlapping matches can still be found.

### Why use UTF-8 bytes?

The constraints contain only lowercase English letters. `[UInt8]` therefore provides safe integer offsets that match the indices expected by LeetCode.

It also avoids repeatedly navigating Swift's variable-width `String.Index` values.

### How to Recognize This Pattern

Think of a **Fixed-Chunk Sliding Window** when:

- every token has the same length
- a substring must contain exact token frequencies
- tokens may appear in any order
- overlapping matches must be preserved

## Explanation [_Second solution_]

The direct solution tests every possible character as the start of a complete concatenation.

For each start, it creates a copy of the required frequencies and reads exactly `words.count` chunks. Every matching chunk decreases its remaining count.

``` text
start = 0
bar → remaining bar: 0
foo → remaining foo: 0
all words matched → record 0
```

The candidate fails immediately if a chunk is unknown or has already been used too many times.

### What changes compared to the optimal solution?

The direct solution is easier to follow, but overlapping candidates repeat most of the same work and copy the frequency dictionary for every starting position.

The sliding window reuses its counts while moving through each alignment, making it much more efficient for large inputs.

## Comparing solutions

| Aspect | Optimal solution: Sliding Window | Second solution: Direct Search |
|:-------|:--------------------------------:|:------------------------------:|
| Advantages | Reuses word frequencies and avoids rechecking complete candidates. | Straightforward and closely follows the problem definition. |
| Disadvantages | Requires separate offsets and careful duplicate handling. | Repeats work and copies the frequency table for each start. |
| When to use it | When the input can be large and all tokens have equal length. | When input sizes are small or clarity is the main priority. |
| Interview recommendation | Preferred because it demonstrates the key fixed-chunk window insight. | Useful as a correct baseline before optimization. |

## Complexity comparison

Let `n` be the length of `s`, `k` the number of words, and `w` the length of each word.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Sliding Window | `O(n × w + k × w)` | `O(n + k × w)` | Every aligned chunk enters and leaves a window at most once. Creating and hashing each chunk costs `O(w)`; the UTF-8 array and frequency dictionaries store the input bytes and distinct words. |
| Direct Search | `O((n - k × w + 1) × k × w)` | `O(n + k × w)` | Every possible start may inspect all `k` words, each of length `w`. The UTF-8 array and copied frequency dictionary require linear input storage. |
