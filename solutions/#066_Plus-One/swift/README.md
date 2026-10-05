## Explanation [_Optimal solution_]

Addition starts at the least significant digit, so traverse the array from right to left.

- If the current digit is smaller than `9`, increment it and return immediately because no carry remains.
- If the current digit is `9`, replace it with `0` and continue carrying one to the left.
- If every digit was `9`, prepend `1` to the zero-filled result.

``` swift
for index in digits.indices.reversed() {
    if digits[index] < 9 {
        digits[index] += 1
        return digits
    }

    digits[index] = 0
}

digits.insert(1, at: 0)
return digits
```

The early return also means that inputs without trailing nines require only one iteration.

### How to Recognize This Pattern

Consider **Right-to-Left Carry Simulation** when arithmetic is represented digit by digit and a carry propagates toward more significant positions.

## Explanation [_Second solution_]

Instead of propagating the carry one digit at a time, find the last digit that is not `9`.

Increment that digit, then turn every following `9` into `0`. If no such digit exists, every original digit was `9`, so the answer is `1` followed by the same number of zeroes.

``` swift
guard let incrementIndex = digits.lastIndex(where: { $0 != 9 }) else {
    return [1] + Array(repeating: 0, count: digits.count)
}

digits[incrementIndex] += 1

if incrementIndex + 1 < digits.count {
    for index in (incrementIndex + 1)..<digits.count {
        digits[index] = 0
    }
}
```

## Comparing solutions

| Aspect | Optimal solution: Carry Simulation | Second solution: Last Non-Nine Digit |
|:-------|:----------------------------------:|:------------------------------------:|
| Advantages | Directly models addition and often returns after inspecting one digit. | Separates locating the changed digit from resetting the suffix. |
| Disadvantages | The carry logic must be followed from right to left. | May perform one pass to search and another over the trailing nines. |
| When to use it | For digit-array arithmetic and more general carry problems. | When the operation specifically adds one and trailing nines are the only special case. |
| Interview recommendation | Preferred because it is concise and generalizes naturally. | A valid alternative that highlights the structure of the suffix. |

## Complexity comparison

Let `n` be the number of elements in `digits`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Carry Simulation | `O(n)` | `O(1)` | In the worst case, every digit is visited; excluding the returned array, only the loop index is stored. |
| Last Non-Nine Digit | `O(n)` | `O(1)` | Searching for the last non-nine digit and clearing its suffix together process at most a linear number of positions; the returned array is excluded. |
