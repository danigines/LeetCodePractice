## Explanation [_Optimal solution_]

Multiplying `x` exactly `|n|` times is too slow for a large exponent. Binary exponentiation uses the exponent's binary representation and halves the remaining work after every iteration.

At each step:

- If the exponent is odd, include the current base in the result.
- Square the base so it represents the next power of two.
- Divide the exponent by two.

``` swift
if exponent % 2 == 1 {
    result *= base
}

base *= base
exponent /= 2
```

For example, `x¹³ = x⁸ × x⁴ × x¹` because `13 = 8 + 4 + 1`.

For a negative exponent, use `x⁻ⁿ = (1 / x)ⁿ`. The exponent is first converted to `Int64`, so negating the allowed minimum 32-bit value is safe.

### How to Recognize This Pattern

Consider **Binary Exponentiation** when an operation is associative and a large integer exponent or repetition count can be decomposed into powers of two.

## Explanation [_Second solution_]

The recursive version applies exponentiation by squaring directly:

``` text
power(x, n) = power(x, n / 2)²                 when n is even
power(x, n) = power(x, n / 2)² × x             when n is odd
```

Each call computes the half power only once, stores it, and reuses it. Calling the helper twice would duplicate the same recursion and lose the logarithmic-time benefit.

## Comparing solutions

| Aspect | Optimal solution: Iterative Binary Power | Second solution: Recursive Squaring |
|:-------|:---------------------------------------:|:-----------------------------------:|
| Advantages | Logarithmic time with constant auxiliary space. | Closely mirrors the mathematical recurrence. |
| Disadvantages | Requires tracking the changing base and exponent. | Uses one stack frame per halving step. |
| When to use it | When both runtime and auxiliary space matter. | When the recursive identity is clearer to communicate. |
| Interview recommendation | Preferred after explaining the binary decomposition. | A concise alternative if recursion is acceptable. |

## Complexity comparison

Let `N = |n|` be the magnitude of the exponent.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Iterative Binary Power | `O(log N)` | `O(1)` | Every iteration halves the exponent and stores only the result, base, and remaining exponent. |
| Recursive Squaring | `O(log N)` | `O(log N)` | Every call halves the exponent, while one recursion frame remains for each level. |
