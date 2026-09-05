## Explanation [_Optimal solution_]

We build each combination from left to right while keeping track of:

```text
openCount  → opening parentheses already used
closeCount → closing parentheses already used
```

For:

```text
n = 3
```

every complete combination must contain three opening and three closing parentheses.

However, not every sequence of six parentheses is valid. We avoid invalid branches by enforcing two rules while building the string.

### When can we add an opening parenthesis?

We can add `"("` while:

``` swift
openCount < n
```

This guarantees that we never use more than the available `n` opening parentheses.

### When can we add a closing parenthesis?

We can add `")"` only while:

``` swift
closeCount < openCount
```

This rule guarantees that every closing parenthesis has an unmatched opening parenthesis before it.

For example, this prefix is invalid:

```text
())
```

because the second closing parenthesis has nothing to match.

By rejecting that decision immediately, the algorithm explores only prefixes that can still become well-formed combinations.

### The Backtracking Cycle

Every valid decision follows the same cycle:

```text
Choose → Explore → Undo
```

For an opening parenthesis:

``` swift
currentCombination.append("(")
backtrack(openCount + 1, closeCount)
currentCombination.removeLast()
```

Removing the last character restores the previous state so the next valid decision can be explored.

### When do we save a combination?

When all opening and closing parentheses have been used:

``` swift
openCount == n && closeCount == n
```

all pairs have been used. Because every earlier decision followed the validity rules, the completed string is guaranteed to be well-formed.

### How to Recognize Backtracking

Think of **Backtracking** when:

- the problem asks for all valid combinations or configurations
- a solution is built one decision at a time
- partial candidates can be rejected before they are complete
- each decision must be undone before exploring another option

The key question is:

> Can I define rules that prevent an incomplete candidate from ever becoming invalid?

If so, backtracking can prune entire invalid branches instead of generating and validating every possible sequence.

## Explanation [_Second solution_]

The Dynamic Programming solution builds the answer from solutions to smaller pair counts.

Every valid combination with `n` pairs can be decomposed uniquely as:

```text
( leftCombination ) rightCombination
```

If the outer pair contains `i` pairs, the remaining part contains:

```text
n - 1 - i
```

pairs.

For `n = 3`, the possible distributions are:

```text
i = 0 → ( dp[0] ) dp[2]
i = 1 → ( dp[1] ) dp[1]
i = 2 → ( dp[2] ) dp[0]
```

We start with:

``` swift
combinationsByPairCount[0] = [""]
```

The empty string is the only valid combination with zero pairs and allows the recurrence to construct:

```text
dp[1] = ["()"]
```

then:

```text
dp[2] = ["()()", "(())"]
```

and finally all valid combinations for `dp[3]`.

### Why does this generate every valid combination once?

Every non-empty well-formed string has a first opening parenthesis and one closing parenthesis that matches it.

The content inside that pair is a valid combination, and everything after it is another valid combination. Their pair counts determine exactly one split in the recurrence, so no valid result is missed or duplicated.

### What changes compared to the optimal solution?

Backtracking constructs one candidate at a time and stops invalid branches immediately.

Dynamic Programming stores all valid combinations for every smaller pair count and combines them to build larger answers. This provides a useful recurrence, but it retains substantially more intermediate strings in memory.

## Comparing solutions

| Aspect | Optimal solution: Backtracking | Second solution: Dynamic Programming |
|:-------|:------------------------------:|:------------------------------------:|
| Advantages | Generates only valid prefixes, uses little auxiliary space, and directly models the validity rules. | Expresses the Catalan recurrence clearly and reuses all previously computed pair counts. |
| Disadvantages | Requires careful state restoration and pruning conditions. | Stores many intermediate combinations and performs repeated string concatenations. |
| When to use it | When candidates can be built incrementally and invalid branches can be pruned early. | When the problem can be decomposed into independent valid structures of smaller sizes. |
| Interview recommendation | Preferred. It is direct, efficient, and demonstrates pruning through constraints. | Strong alternative for explaining the recursive structure behind Catalan-number problems. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Backtracking | `O(n × Cₙ)` | `O(n)` auxiliary | `n` is the number of parenthesis pairs and `Cₙ` is the nth Catalan number, which equals the number of valid results. Constructing each result requires `2n` decisions, while the recursion and current combination use linear auxiliary space. The returned output itself occupies `O(n × Cₙ)` space. |
| Dynamic Programming | `O(n × Cₙ)` | `O(n × Cₙ)` | `n` is the number of pairs and `Cₙ` is the nth Catalan number. The algorithm constructs every valid length-`2n` result and stores both the final results and valid combinations for smaller pair counts. |
