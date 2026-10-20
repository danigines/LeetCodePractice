## Explanation [_Optimal solution_]

Sort `nums` so equal values are adjacent, then build every subset with backtracking.

At each recursive level, append the current subset to the result and try every available next value. When two adjacent values are equal, skip the later one only if the earlier one was already considered at the same recursive level:

``` swift
if index > start, sortedNums[index] == sortedNums[index - 1] {
    continue
}
```

This still allows multiple equal values inside one subset. For `[1,2,2]`, the second `2` is skipped as another first choice after `[1]`, but it remains available after choosing the first `2`, which produces `[1,2,2]`.

After exploring a choice, remove it before trying the next value.

### How to Recognize This Pattern

Consider **Sorted Backtracking with Same-Level Deduplication** when the input contains repeated values but each unique combination must be generated exactly once.

## Explanation [_Second solution_]

Start with the empty subset and process the sorted values from left to right. For a new value, append it to every subset that currently exists.

When the value duplicates the previous one, append it only to the subsets created during the previous iteration:

``` swift
let isDuplicate = index > 0 && sortedNums[index] == sortedNums[index - 1]
let start = isDuplicate ? previousResultCount : 0
```

Extending older subsets again would reproduce subsets already created by the previous equal value. Restricting the start position prevents those duplicates without requiring a set.

The **Bit Manipulation** topic represents another valid approach that enumerates selection masks and rejects a duplicate value when its previous equal value is not selected; the iterative Swift solution instead grows only valid subsets.

## Comparing solutions

| Aspect | Optimal solution: Backtracking | Second solution: Iterative Expansion |
|:-------|:------------------------------:|:------------------------------------:|
| Advantages | Expresses subset construction directly and prunes duplicate branches before exploring them. | Avoids recursion and extends only subsets known to remain unique. |
| Disadvantages | Requires careful distinction between duplicates at the same level and repeated values in one subset. | Must track exactly where the previous iteration's new subsets begin. |
| When to use it | When practicing combination generation and backtracking invariants. | When an iterative powerset construction is preferred. |
| Interview recommendation | Preferred because the same-level duplicate rule generalizes to many combination problems. | A concise alternative once the previous-result boundary is understood. |

## Complexity comparison

Let `n` be the number of elements in `nums` and `N` the number of distinct subsets returned, where `N <= 2ⁿ`.

| Solution | Time | Auxiliary Space | Reason |
|:---------|:----:|:---------------:|:-------|
| Backtracking | `O(n × N)` | `O(n)` | Up to `N` subsets of length at most `n` are copied, while sorting, the current subset, and the recursion stack use linear space apart from the output. |
| Iterative Expansion | `O(n × N)` | `O(n)` | Every returned subset is created by copying at most `n` values, while the sorted input and temporary copied subset use linear space apart from the output. |
