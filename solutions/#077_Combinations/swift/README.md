## Explanation [_Optimal solution_]

Build each combination in increasing order. A recursive call receives the smallest number that may be chosen next, which prevents generating different orders of the same combination.

If the current path still needs `remainingNeeded` values, the next candidate cannot exceed:

``` text
maximumCandidate = n - remainingNeeded + 1
```

Any larger candidate would leave too few numbers to complete the path. Limiting the loop to this boundary prunes impossible branches before exploring them.

``` swift
func backtrack(_ start: Int) {
    if combination.count == k {
        results.append(combination)
        return
    }

    let remainingNeeded = k - combination.count
    let maximumCandidate = n - remainingNeeded + 1

    guard start <= maximumCandidate else {
        return
    }

    for number in start...maximumCandidate {
        combination.append(number)
        backtrack(number + 1)
        combination.removeLast()
    }
}
```

### How to Recognize This Pattern

Consider **Backtracking with an Increasing Start** when order does not matter, each candidate may be used once, and every fixed-size selection must be generated.

## Explanation [_Second solution_]

For each number from `1` through `n`, make a binary decision:

- Include the current number and continue.
- Exclude the current number and continue.

Stop when the path contains `k` numbers. Also stop when the number of remaining candidates is smaller than the number of still-needed values.

``` swift
func decide(_ number: Int) {
    if combination.count == k {
        results.append(combination)
        return
    }

    guard number <= n else {
        return
    }

    let remainingCandidates = n - number + 1

    guard combination.count + remainingCandidates >= k else {
        return
    }

    combination.append(number)
    decide(number + 1)
    combination.removeLast()

    decide(number + 1)
}
```

This approach makes the decision tree explicit, but it explores more intermediate states than directly enumerating the next candidate.

## Comparing solutions

| Aspect | Optimal solution: Candidate Enumeration | Second solution: Include or Exclude |
|:-------|:---------------------------------------:|:-----------------------------------:|
| Advantages | Prunes the loop boundary and generates only increasing paths. | Makes every selection decision explicit and is easy to generalize. |
| Disadvantages | The upper-bound formula requires careful reasoning. | Explores a larger binary decision tree. |
| When to use it | When generating fixed-size combinations efficiently. | When a problem naturally asks whether each element should be selected. |
| Interview recommendation | Preferred because it is concise and avoids impossible branches early. | Useful for first explaining the complete search tree. |

## Complexity comparison

Let `n` be the size of the range, `k` the required combination length, and `C(n, k)` the number of ways to choose `k` values from `n`. Space below excludes the returned combinations, which require `O(C(n, k) × k)` space.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Candidate Enumeration | `O(C(n, k) × k)` | `O(k)` | Every one of the `C(n, k)` combinations is copied with `k` values, and the path plus recursion depth contain at most `k` values. |
| Include or Exclude | `O(2ⁿ + C(n, k) × k)` | `O(n)` | The binary decision tree has up to `2ⁿ` states, each result copy contains `k` values, and recursion may reach depth `n`. |
