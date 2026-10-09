## Explanation [_Optimal solution_]

Use the **Dutch National Flag** partition with three pointers:

- `low` marks the next position for a `0`.
- `current` examines the unknown section.
- `high` marks the next position for a `2`.

The array is divided into four regions:

``` text
[0 ... low - 1]       contains only 0s
[low ... current - 1] contains only 1s
[current ... high]    remains unknown
[high + 1 ... end]    contains only 2s
```

When the current value is `0`, swap it toward `low` and advance both pointers. When it is `1`, only advance `current`. When it is `2`, swap it toward `high` and decrease `high`.

Do not advance `current` after moving a `2`: the value brought from the right side has not been examined yet.

``` swift
while current <= high {
    switch nums[current] {
    case 0:
        nums.swapAt(low, current)
        low += 1
        current += 1
    case 1:
        current += 1
    default:
        nums.swapAt(current, high)
        high -= 1
    }
}
```

### How to Recognize This Pattern

Consider **Three-Way Partitioning** when an array contains three categories that must be grouped in a specific order without using extra storage.

## Explanation [_Second solution_]

Count how many times each value appears, then overwrite the array with that many `0`s, followed by `1`s and `2`s.

``` swift
var counts = Array(repeating: 0, count: 3)

for number in nums {
    counts[number] += 1
}

var index = 0

for color in 0...2 {
    for _ in 0..<counts[color] {
        nums[index] = color
        index += 1
    }
}
```

This solution also uses constant auxiliary space, but it requires two passes and therefore does not satisfy the one-pass follow-up.

## Comparing solutions

| Aspect | Optimal solution: Three-Way Partition | Second solution: Counting |
|:-------|:-------------------------------------:|:-------------------------:|
| Advantages | Sorts in one pass with constant extra space. | Simple and easy to verify. |
| Disadvantages | Pointer movement after each swap requires care. | Traverses the array twice. |
| When to use it | When the one-pass follow-up must be satisfied. | When the number of possible values is small and an extra pass is acceptable. |
| Interview recommendation | Preferred because it demonstrates the Dutch National Flag pattern. | A clear baseline before optimizing to one pass. |

## Complexity comparison

Let `n` be the number of elements in `nums`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Three-Way Partition | `O(n)` | `O(1)` | Each value leaves the unknown region once, and only three pointers are stored. |
| Counting | `O(n)` | `O(1)` | The array is read and rewritten once, while the count array always contains exactly three entries. |
