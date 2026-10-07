## Explanation [_Optimal solution_]

To reach stair `step`, the final move must come from either `step - 1` with a one-step move or `step - 2` with a two-step move. Therefore:

``` text
ways(step) = ways(step - 1) + ways(step - 2)
```

The recurrence is the Fibonacci pattern. Because each state depends only on the previous two values, store them in two variables instead of an entire array.

``` swift
var oneStepBefore = 1
var twoStepsBefore = 1

for _ in 2...n {
    let current = oneStepBefore + twoStepsBefore
    twoStepsBefore = oneStepBefore
    oneStepBefore = current
}
```

The base value `ways(0) = 1` represents the single way to remain at the starting point, while `ways(1) = 1` represents one single-step move.

### How to Recognize This Pattern

Consider **Rolling Dynamic Programming** when a recurrence uses only a fixed number of previous states and older values can be discarded.

## Explanation [_Second solution_]

Start with the same recurrence, but evaluate it recursively. A plain recursive solution repeats the same subproblems, so store each computed result in `memo`.

``` swift
func countWays(_ step: Int) -> Int {
    if step <= 1 {
        return 1
    }

    if memo[step] != 0 {
        return memo[step]
    }

    memo[step] = countWays(step - 1) + countWays(step - 2)
    return memo[step]
}
```

Every stair is calculated once; later requests reuse its cached value.

## Comparing solutions

| Aspect | Optimal solution: Rolling DP | Second solution: Memoized Recursion |
|:-------|:----------------------------:|:-----------------------------------:|
| Advantages | Uses constant auxiliary space and avoids recursion. | Mirrors the recurrence directly and demonstrates memoization clearly. |
| Disadvantages | The meaning of the rolling variables must be maintained carefully. | Uses a memo array and a recursion stack. |
| When to use it | When each state depends on only a few immediately preceding states. | When first deriving a recurrence or when only some states may be needed. |
| Interview recommendation | Preferred after explaining the recurrence and base cases. | A strong intermediate step before optimizing the stored states. |

## Complexity comparison

Let `n` be the number of stairs.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Rolling DP | `O(n)` | `O(1)` | Every stair is processed once, while only the previous two counts are stored. |
| Memoized Recursion | `O(n)` | `O(n)` | Each stair is computed once; the memo array and recursion stack can each contain up to `n` entries. |
