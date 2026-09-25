## Explanation [_Optimal solution_]

Sort the numbers so equal values are adjacent, then build each permutation by choosing unused indices. The important rule is:

``` swift
if index > 0 &&
    sortedNumbers[index] == sortedNumbers[index - 1] &&
    !used[index - 1] {
    continue
}
```

If two equal values are both unused at the current recursion level, choosing the later copy first would create the same branches as choosing the earlier copy. We therefore allow an equal value only after its previous copy is already part of the current path.

The `used` array still distinguishes indices while constructing a permutation. After the recursive call, remove the last value and mark its index available again.

``` text
sorted nums = [1a, 1b, 2]

At the first position:
- choose 1a
- skip 1b because 1a is still unused
- choose 2
```

### How to Recognize This Pattern

Consider **Sorted Backtracking with Duplicate Skipping** when the input may repeat values but the result must contain unique arrangements. Sorting makes equivalent choices adjacent, and the usage state tells whether a duplicate belongs to the same path or would repeat a branch.

## Explanation [_Second solution_]

Group equal values in a frequency dictionary. At every position, choose a distinct value whose remaining count is positive, decrease its count, recurse, and restore the count afterward.

Copies of the same number are never treated as separate choices, so duplicate branches cannot be created. This makes the uniqueness rule explicit, although dictionary updates add more machinery than the sorted-index approach.

## Comparing solutions

| Aspect | Optimal solution: Sorted Indices | Second solution: Frequencies |
|:-------|:--------------------------------:|:----------------------------:|
| Advantages | Standard pattern with direct pruning of duplicate choices. | Represents equal copies as one choice with a remaining count. |
| Disadvantages | The `!used[index - 1]` condition requires careful explanation. | Maintains a dictionary throughout recursion. |
| When to use it | For the conventional interview solution. | When repeated values are easier to reason about as counts. |
| Interview recommendation | Preferred because it generalizes to many duplicate-input backtracking problems. | A clear alternative when frequency modeling feels natural. |

## Complexity comparison

Let `n` be the number of elements in `nums`, `d` the number of distinct values, and `U` the number of unique permutations. Each returned permutation contains `n` elements. Output storage is excluded from auxiliary space.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Sorted Indices | `O(n log n + n × U)` | `O(n)` auxiliary | Sorting precedes generation, and copying each of the `U` results costs `O(n)`. The sorted array, path, usage array, and recursion stack are linear. |
| Frequencies | `O(n + d log d + n × U)` | `O(n + d)` auxiliary | Building counts is linear, sorting the `d` keys costs `O(d log d)`, and each result costs `O(n)` to copy. Counts, path, keys, and recursion use `O(n + d)` space. |

The returned collection itself occupies `O(n × U)` space for either solution. When all values are distinct, `U = n!`; duplicates reduce `U`.
