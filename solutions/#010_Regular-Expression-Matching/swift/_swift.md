## Explanation [_Optimal solution_]
### First: what is Dynamic Programming?
Dynamic Programming is used when a problem can be broken down into **repeating subproblems**.

Here, we can ask:
> Do the first **`i`** characters of **`s`** match the first **`j`** characters of **`p`**?

Instead of solving that question repeatedly, we store the result.

### Normal case
If the pattern contains:
```
a
```
can only consume a character if they both match.

`.` It works the same, but accepts any character:
``` text
s="b"
p = "."
→ true
```

### The important case: *
Let's assume:
```
p = "a*"
```
`*` allows for two choices.

**1. Use zero occurrences of `'a'`**
We completely ignore:
```
a*
```
That is why we use the state corresponding to two positions back:
``` swift
dp[j - 2]
```
**2. Use one or more occurrences**

If the current character matches `'a'`, we can consume it and keep 'a*' available to continue consuming more:
``` swift
matchesCurrent && previousRowSameColumn
```
For example:
``` text
s = "aaa"
p = "a*"
```
`'a*'` can consume all three characters.

### Why is `.*` so powerful?
`.` matches any character and `*` allows it to be repeated:
```
.*
```
conceptually means:
> zero or more characters of any kind.

That is why:
``` text
s = "ab"
p = ".*"
```
evaluates to `true`.

### Why do we only need one row?
A traditional DP table would have:
```
dp[i][j]
```
but each state only needs information from:
- the current row
- the previous row

That is why we reuse a single `dp` array.

`previousDiagonal` preserves the old:
```
dp[i - 1][j - 1]
```
before overwriting it.

It is a memory optimization of the classic DP approach.

### How to recognize Dynamic Programming
Consider DP when:
- there are multiple possible decisions at each position
- those decisions generate the same subproblems repeatedly
- the result depends on combinations of indices or states
- a simple recursive solution starts repeating too much work

Here `*` creates precisely those decisions:
```
use zero occurrences
OR
use one or more occurrences
```

## Explanation [_Second solution_]
Here we define:
```
match(i, j)
```
as:
> Does `s[i...]` match `p[j...]`?

For a standard character, if they match, we advance in both:
```
(i + 1, j + 1)
```
The interesting case is once again `*`.

If we have:
```
a*
```
we can:
**1.** Ignore it completely:
```
match(i, j + 2)
```
**2.** Consume a character and keep the pattern:
```
match(i + 1, j)
```
The second case is valid only if the current character matches.

### Why do we need memoization?
Without memoization, different recursive branches might re-solve:
```
match(i, j)
```
many times.

`memo` stores the result the first time:
```
(i, j) → true / false
```
This way, each combination is calculated at most once.

### What changes compared to the optimal solution?
The logic is almost the same. The difference lies in how the states are evaluated:
- **Top-down**: recursion + memoization.
- **Optimized bottom-up**: calculates states iteratively using an array.

The recursive solution is usually easier for initially understanding the relationship between the subproblems.

## Comparing solutions
| Aspect | Optimal solution: 1D DP | Second solution: Recursion + Memoization |
|:-------|:-------:|:-------:|
| Advantages | `O(n)` space; avoids recursion; maintains `O(m × n)` time. | The relationship between decisions and subproblems is more intuitive. |
| Disadvantages | Single-line optimization makes the code less obvious. | It uses `O(m × n)` memory and call stack. |
| When to use it | When you want to optimize memory and avoid recursion depth issues. | When you want to derive the recurrence clearly first. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| 1D DP | `O(m × n)` | `O(n)` | Evaluate each string/pattern combination and reuse only a single row of states. |
| Recursion + Memoization | `O(m × n)` | `O(m × n)` | Each pair of indices is calculated once and stored in the memoization matrix. |
