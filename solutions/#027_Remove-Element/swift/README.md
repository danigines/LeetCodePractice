## Explanation [_Optimal solution_]
We use a read/write strategy to build the valid part of `nums` in-place.

```text
read position → examines every value
writeIndex    → indicates where the next retained value belongs
```

For:

```text
nums = [3, 2, 2, 3]
val = 3
```

the process is:

```text
Read 3 → skip
Read 2 → write at index 0
Read 2 → write at index 1
Read 3 → skip
```

The valid prefix becomes:

```text
[2, 2]
```

and `writeIndex` is `2`, which is the required return value.

### Why does `writeIndex` represent the answer?

It starts at zero and advances only when we keep an element:

``` swift
if number != val {
    nums[writeIndex] = number
    writeIndex += 1
}
```

Therefore, it always equals the number of valid elements already written.

### Why don't we remove elements directly?

Removing an element from a Swift array shifts the later elements and can make repeated removals expensive.

The custom judge only checks the first `k` positions, so overwriting the valid prefix is sufficient.

### Does this solution preserve order?

Yes. Every retained value is copied in the same order in which it is read.

Preserving order is not required by this problem, but it makes the behavior predictable without affecting the complexity.

### How to Recognize This Pattern

Think of **Read/Write Two Pointers** when:

- an array must be filtered or compacted in-place
- only a valid prefix matters
- one pointer can scan the input
- another pointer can mark the next output position

## Explanation [_Second solution_]

Because the problem allows the order to change, an unwanted value can be replaced with a value from the active end of the array.

For:

```text
nums = [3, 2, 2, 3]
val = 3
```

the first `3` is initially replaced by the last active value:

```text
[3, 2, 2, 3]
 ↑        ↑

[3, 2, 2, 3] → active length = 3
```

That replacement is also `3`, so the same position is checked again and replaced with the new last active value, `2`:

```text
[2, 2, 2, 3] → active length = 2
```

The replacement must always be checked again because it may also equal `val`. Therefore, `currentIndex` advances only when the current value is valid.

### Why can the active length shrink?

Once the last active value has been copied forward, its old position no longer matters. Decreasing `validCount` removes that position from future consideration.

### What changes compared to the optimal solution?

Both solutions use linear time and constant auxiliary space.

The read/write solution preserves order and examines every element. The swap-with-end solution may perform fewer assignments when `val` appears rarely, but it changes the order of retained values.

## Comparing solutions

| Aspect | Optimal solution: Read/Write Pointers | Second solution: Swap With End |
|:-------|:-------------------------------------:|:------------------------------:|
| Advantages | Simple, stable, and writes a predictable valid prefix. | Can reduce assignments when few elements equal `val`. |
| Disadvantages | Examines every element and writes every retained value. | Changes element order and must recheck each replacement. |
| When to use it | When clear behavior or preserved order is preferred. | When order is irrelevant and minimizing writes may help. |
| Interview recommendation | Preferred because it is direct and easy to prove correct. | Strong alternative that uses the problem's relaxed ordering requirement. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Read/Write Pointers | `O(n)` | `O(1)` | `n` is the number of elements in `nums`. Every value is read once, and only one write index is maintained. |
| Swap With End | `O(n)` | `O(1)` | `n` is the number of elements. Every position is removed from the active range or passed by `currentIndex` at most once, using only fixed indices. |
