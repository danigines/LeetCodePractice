## Explanation [_Optimal solution_]

We can reconstruct the quotient using powers of two instead of multiplication, division, or modulo.

For:

``` text
dividend = 43
divisor  = 5
```

we look for shifted copies of `5` that fit inside `43`:

``` text
5 << 3 = 40  → quotient includes 8
remainder = 3
```

The result is `8`, and the remainder is discarded, which naturally truncates toward zero.

### Why use absolute values?

The division is easier to calculate with positive magnitudes. After building the quotient, its sign is negative only when exactly one input is negative:

``` swift
if (dividend < 0) != (divisor < 0) {
    quotient = -quotient
}
```

### Why use `Int64` internally?

The magnitude of `Int32.min` is `2³¹`, which cannot be represented as a positive `Int32`.

Converting to `Int64` before taking the absolute value safely represents every possible input and every intermediate shifted value.

### How is each quotient bit found?

We inspect shifts from `31` down to `0`. If a shifted divisor fits in the remaining dividend, we subtract it and include the same power of two in the quotient:

``` swift
if (remaining >> shift) >= divisorMagnitude {
    remaining -= divisorMagnitude << shift
    quotient += Int64(1) << shift
}
```

The comparison uses a right shift on `remaining` to avoid creating an unnecessarily large value before confirming that the divisor fits.

### What is the overflow case?

The only possible result outside the signed 32-bit range is:

``` text
−2³¹ ÷ −1 = 2³¹
```

The problem requires returning `2³¹ − 1` in that case.

### How to Recognize This Pattern

Think of **Bit Manipulation for Division** when:

- multiplication, division, and modulo are forbidden
- repeated subtraction would be too slow
- doubling values represents powers of two
- the answer can be constructed one binary bit at a time

## Explanation [_Second solution_]

The second solution also avoids forbidden operators, but finds the largest usable multiple again during every round.

Starting with the divisor, it repeatedly doubles both the divisor and its quotient contribution:

``` text
5 × 1 = 5
5 × 2 = 10
5 × 4 = 20
5 × 8 = 40
```

For `43 ÷ 5`, it subtracts `40`, adds `8` to the quotient, and stops because the remaining `3` is smaller than `5`.

### What changes compared to the optimal solution?

The optimal solution scans the fixed set of possible quotient bits once. The second solution restarts its doubling search after every subtraction, so it can revisit the same powers of two.

Both solutions use constant auxiliary space and correctly handle signs and 32-bit overflow.

## Comparing solutions

| Aspect | Optimal solution: Bit-by-Bit Division | Second solution: Exponential Subtraction |
|:-------|:-------------------------------------:|:----------------------------------------:|
| Advantages | Examines every possible quotient bit once. | Mirrors repeated subtraction and is easy to derive incrementally. |
| Disadvantages | Requires understanding binary shifts and bit construction. | Repeats the doubling process after each subtraction. |
| When to use it | When predictable logarithmic time is preferred. | When explaining the optimization from basic repeated subtraction. |
| Interview recommendation | Preferred because it is efficient and handles the restrictions directly. | Useful as a clear intermediate optimization. |

## Complexity comparison

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Bit-by-Bit Division | `O(log |dividend|)` | `O(1)` | Each possible binary position is inspected once, using only fixed numeric variables. |
| Exponential Subtraction | `O(log² |dividend|)` | `O(1)` | Each subtraction can start another logarithmic search for the largest doubled divisor that fits. |
