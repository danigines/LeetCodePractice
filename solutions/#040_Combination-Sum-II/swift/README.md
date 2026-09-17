## Explanation [_Optimal solution_]

We sort the candidates and build each combination through backtracking. Sorting puts equal values together and lets us stop a branch as soon as a candidate exceeds the remaining target.

``` text
input:  [10, 1, 2, 7, 6, 1, 5]
sorted: [1, 1, 2, 5, 6, 7, 10]
```

### Why does the next call use `index + 1`?

Unlike problem 39, each **array element** may be selected at most once. After choosing a candidate, the next choice must come from a later index:

``` swift
current.append(value)
search(index + 1, remaining - value)
current.removeLast()
```

Two equal values at different indices can still both appear in one combination. For example, the two `1`s above can form `[1,1,6]`.

### How do we avoid duplicate combinations?

At the same recursion depth, choosing either copy of an equal value would lead to identical choices afterward. We keep only the first:

``` swift
if index > startIndex && value == sortedCandidates[index - 1] {
    continue
}
```

The check is local to the current depth. It does not prevent a deeper call from selecting the second copy after the first has already been chosen.

### When can a branch stop?

All values are positive. If the current sorted value is greater than the remaining sum, every later candidate is too large as well:

``` swift
if value > remaining { break }
```

When the remaining sum reaches zero, we copy the current combination into the results.

### How to Recognize This Pattern

Think of **Backtracking with Duplicate Inputs** when:

- every unique combination must be returned
- input values may repeat
- each input position has limited use
- sorting enables duplicate skipping and pruning

## Explanation [_Second solution_]

The alternative groups equal values into `(value, count)` pairs:

``` text
[1, 1, 2, 2, 2, 5] → [(1, 2), (2, 3), (5, 1)]
```

For each group, it chooses a quantity from zero up to the number available, without exceeding the remaining target. Then it moves to the next group.

Because each group is processed once, there is only one path for each frequency choice. Duplicate index arrangements never arise.

### What changes compared to the optimal solution?

Both solutions sort the input and use each element at most once. The primary solution skips duplicate values at each decision level and prunes immediately on an oversized candidate. The grouped solution makes multiplicities explicit, which can be intuitive when the input contains many repeats, but adds a preprocessing step and quantity loop.

## Comparing solutions

| Aspect | Optimal solution: Skip Duplicates | Second solution: Frequency Groups |
|:-------|:---------------------------------:|:---------------------------------:|
| Advantages | Standard concise backtracking with early pruning. | Models duplicate values as one choice of quantity. |
| Disadvantages | The depth-specific duplicate rule needs careful explanation. | Requires grouping and restoring several copies after each loop. |
| When to use it | For the usual sorted backtracking solution. | When many repeated values make frequency choices clearer. |
| Interview recommendation | Preferred because it directly expresses single use and duplicate skipping. | Useful alternative to explain why duplicate results are avoided. |

## Complexity comparison

Let `n` be the number of candidates and `R` the number of returned combinations. Output storage is excluded from auxiliary space.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Skip Duplicates | `O(n log n + n × 2^n)` worst case | `O(n)` | Sorting is followed by subset exploration; copying each valid path takes up to `O(n)`. Sorting, the path, and recursion use linear auxiliary space. |
| Frequency Groups | `O(n log n + n × 2^n)` worst case | `O(n)` | Each distinct value can be chosen from zero to its available count, yielding at most `2^n` quantity combinations; path copies take up to `O(n)`. Groups, path, and recursion use linear space. |
