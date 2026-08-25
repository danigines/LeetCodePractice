## Explanation [_Optimal solution_]
For:
```
digits = "23"
```
we have:
```
2 → a, b, c
3 → d, e, f
```
We start with an empty combination.

We choose `"a"`:
```
"a"
```
and move to the next digit:
```
"ad"
"ae"
"af"
```
Then we go back, remove `"a"`, and try `"b"`:
```
"bd"
"be"
"bf"
```
Finally, we do the same with `"c"`.

### The Backtracking Cycle
Each decision follows three steps:
```
Choose → Explore → Undo
```
In code:
``` swift
currentCombination.append(letter)
backtrack(index + 1)
currentCombination.removeLast()
```
`removeLast()` is important because it restores the state before trying another option.

### When do we save a response?
When:
``` swift
index == digitList.count
```
it means we've already chosen a letter for each digit.

For example:
```
digits = "23"
currentCombination = "ae"
```
It already has a corresponding choice for both `2` and `3`, so we add it to the result.

### How to Recognize Backtracking
Look for this pattern when the problem asks for:
- **all combinations**
- all permutations
- all valid configurations
- exploring multiple options at each position

A particularly strong indicator is:

> At each step, I have several decisions and I need to explore them all.

## Explanation [_Second solution_]
This solution builds the result level by level.

We start with:
```
[""]
```
For digit `2```:
```
["a", "b", "c"]
```
Then we process `3`.

Each existing combination is expanded with:
```
d, e, f
```
Thus:
```
"a" → "ad", "ae", "af"
"b" → "bd", "be", "bf"
"c" → "cd", "ce", "cf"
```
Result:
```
["ad","ae","af","bd","be","bf","cd","ce","cf"]
```

### What's different from backtracking?
Backtracking builds **one combination at a time** and reuses the same state using:
```
choose → recurse → undo
```
The iterative version explicitly maintains all partial combinations generated up to that point.

That's why it typically uses more temporary memory.

## Comparing solutions
| Aspect | Optimal solution: Backtracking | Second solution: Iterative Expansion |
|:-------|:-------:|:-------:|
| Advantages | It naturally models the decision tree; uses little auxiliary space; a highly reusable pattern. | It avoids recursion and is easy to visualize level by level. |
| Disadvantages | It requires understanding the choose/explore/undo cycle. | It maintains many partial combinations simultaneously. |
| When to use it | When we need to explore all possible decisions recursively. | When we want to build combinations iteratively. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Backtracking | `O(n × 4ⁿ)` | `O(n)` | Explores all combinations keeping only the current route in memory. |
| Iterative Expansion | `O(n × 4ⁿ)` | `O(n × 4ⁿ)` | It simultaneously maintains all generated partial combinations. |
