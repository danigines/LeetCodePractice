## Explanation [_Optimal solution_]

Backtracking builds one combination at a time. We track how much remains to reach `target`, try a candidate, recurse, and then remove it before trying the next one.

For `candidates = [2,3,6,7]` and `target = 7`:

``` text
[] → [2] → [2,2] → [2,2,3]  (remaining = 0)
[] → [7]                    (remaining = 0)
```

### Why sort the candidates?

With ascending candidates, a value greater than the remaining sum cannot fit. Every later value is also too large, so the loop stops immediately:

``` swift
if value > remaining { break }
```

This prunes unproductive branches without changing the set of answers.

### How can a value be reused?

After choosing `sortedCandidates[index]`, the recursive call receives the same `index`:

``` swift
current.append(value)
search(index, remaining - value)
current.removeLast()
```

The same number can be chosen again. Removing it afterward restores the path for the next choice.

### Why are the combinations unique?

Each recursive path chooses candidates only from its current index onward. The path never moves backward, so it cannot create both `[2,3,2]` and `[2,2,3]` as separate answers.

We append a copy of the current path only when the remaining sum becomes zero. All candidates are positive, so subtracting them eventually reaches zero or a branch that cannot continue.

### How to Recognize This Pattern

Think of **Backtracking with Reusable Choices** when:

- all valid combinations must be returned
- a choice may be used repeatedly
- order does not create a distinct answer
- the remaining target can prune branches

## Explanation [_Second solution_]

The alternative represents each candidate as two decisions:

``` text
include it → stay at the same index to allow reuse
skip it    → move to the next index permanently
```

For example, after choosing `2`, the recursion may choose another `2`. Once it skips `2`, it can use `3`, `6`, or `7`, but never return to `2`.

This also avoids duplicate permutations. It does not sort the input or stop a whole loop when a value is too large; it considers the include/skip decision for every candidate.

### What changes compared to the optimal solution?

Both solutions generate every valid combination and use backtracking. The sorted for-loop version can stop exploring later values as soon as one exceeds the remaining sum. The include/skip version is a simpler decision tree, but may visit more states.

## Comparing solutions

| Aspect | Optimal solution: Sorted Backtracking | Second solution: Include/Skip Backtracking |
|:-------|:-------------------------------------:|:------------------------------------------:|
| Advantages | Prunes larger candidates early. | Makes the reuse and skip decisions explicit. |
| Disadvantages | Needs a sorted copy and a for-loop over choices. | May visit more branches, especially with unsuitable candidates. |
| When to use it | When efficient enumeration is preferred. | When learning the include/skip recursion pattern. |
| Interview recommendation | Preferred for a clean, pruned solution. | Good baseline before adding ordering and pruning. |

## Complexity comparison

Let `k` be the number of candidates, `m` the smallest candidate, and `d = ⌊target / m⌋`. Output storage is excluded from auxiliary space.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Sorted Backtracking | `O(k log k + k^d × d)` worst case | `O(k + d)` | Sorting costs `O(k log k)`; the search can branch across candidates to depth `d`, and copying a result costs up to `O(d)`. The sorted copy, path, and recursion stack use `O(k + d)` space. |
| Include/Skip Backtracking | `O(2^(k + d) × d)` worst case | `O(k + d)` | Each state can include or skip a candidate, and a path can contain up to `d` inclusions and `k` skips. Copying a result costs up to `O(d)`; the path and stack use `O(k + d)` space. |
