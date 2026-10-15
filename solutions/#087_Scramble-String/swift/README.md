## Explanation [_Optimal solution_]

Represent a recursive state with three values:

``` text
(firstStart, secondStart, length)
```

The state answers whether the substring of `s1` beginning at `firstStart` can scramble into the equally sized substring of `s2` beginning at `secondStart`.

For every possible split, test both valid arrangements:

- **Without swap**: left matches left and right matches right.
- **With swap**: left matches right and right matches left.

``` swift
let withoutSwap = dfs(firstStart, secondStart, splitLength)
    && dfs(firstStart + splitLength, secondStart + splitLength, remainingLength)

let withSwap = dfs(firstStart, secondStart + remainingLength, splitLength)
    && dfs(firstStart + splitLength, secondStart, remainingLength)
```

Memoization prevents the same state from being solved repeatedly. Before testing splits, compare character frequencies; substrings with different characters cannot be scrambles and are rejected immediately.

### How to Recognize This Pattern

Consider **Memoized Interval Recursion** when two equal-length ranges can be divided at every possible position and the subranges may correspond either directly or in swapped order.

## Explanation [_Second solution_]

Use bottom-up interval Dynamic Programming. Define:

``` text
dp[firstStart][secondStart][length]
```

as whether the corresponding substrings of `s1` and `s2` are scrambles.

Initialize states of length `1` by comparing individual characters. Then calculate longer lengths from shorter states, trying every split with and without swapping the two parts.

This solution removes recursion and makes the dependency order explicit, but it evaluates the complete state space even when many states are unnecessary.

## Comparing solutions

| Aspect | Optimal solution: Memoized Search | Second solution: Interval DP |
|:-------|:---------------------------------:|:----------------------------:|
| Advantages | Evaluates only reached states and prunes mismatched character groups early. | Avoids recursion and fills states in a predictable order. |
| Disadvantages | Requires a recursive state, memo table, and frequency validation. | Evaluates the complete three-dimensional state space. |
| When to use it | When pruning can avoid substantial unnecessary work. | When an iterative Dynamic Programming formulation is preferred. |
| Interview recommendation | Preferred because the recursive split definition closely matches the problem statement. | Useful after deriving the same recurrence and its base case. |

## Complexity comparison

Let `n` be the common length of `s1` and `s2`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Memoized Search | `O(n⁴)` | `O(n³)` | There are `O(n³)` substring-pair states, and each may inspect up to `n` split positions; the memo table stores every possible state. |
| Interval DP | `O(n⁴)` | `O(n³)` | Three dimensions enumerate both starts and the substring length, while every state may test up to `n` splits. |
