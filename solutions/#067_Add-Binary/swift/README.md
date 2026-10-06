## Explanation [_Optimal solution_]

Binary addition starts with the least significant bits, so read both strings from right to left. At each position, add the available bits and the carry from the previous position.

``` text
sumBit = total mod 2
carry  = total / 2
```

Append each resulting bit in reverse order. Continue until both strings and the carry are exhausted, then reverse the collected characters once to produce the answer.

``` swift
while leftIndex > a.startIndex || rightIndex > b.startIndex || carry > 0 {
    var total = carry

    if leftIndex > a.startIndex {
        leftIndex = a.index(before: leftIndex)
        total += a[leftIndex] == "1" ? 1 : 0
    }

    if rightIndex > b.startIndex {
        rightIndex = b.index(before: rightIndex)
        total += b[rightIndex] == "1" ? 1 : 0
    }

    reversedSum.append(total % 2 == 0 ? "0" : "1")
    carry = total / 2
}
```

Using `String.Index` avoids creating complete character arrays for both input strings.

### How to Recognize This Pattern

Consider **Right-to-Left Carry Simulation** when numbers are stored as strings and may be too large for built-in integer types.

## Explanation [_Second solution_]

A binary full adder can compute the result without adding the three values directly:

``` text
sumBit = leftBit XOR rightBit XOR carry
carry  = (leftBit AND rightBit)
         OR (carry AND (leftBit XOR rightBit))
```

Reverse both input strings to align equal positions, treat a missing bit as zero, and apply these formulas at every index. Append the final carry if it remains set.

``` swift
let bitsXOR = leftBit ^ rightBit
let sumBit = bitsXOR ^ carry
carry = (leftBit & rightBit) | (carry & bitsXOR)
reversedSum.append(sumBit == 0 ? "0" : "1")
```

## Comparing solutions

| Aspect | Optimal solution: Arithmetic Carry | Second solution: Binary Full Adder |
|:-------|:----------------------------------:|:----------------------------------:|
| Advantages | Reads the original strings directly and closely matches manual addition. | Demonstrates the XOR and AND rules used by a binary adder. |
| Disadvantages | Requires careful backward movement through both strings. | Creates reversed input arrays and uses less familiar bitwise formulas. |
| When to use it | For practical addition of arbitrarily long numeric strings. | When emphasizing bit manipulation or digital addition rules. |
| Interview recommendation | Preferred because it is direct, readable, and space-conscious. | Present as an alternative after explaining the full-adder equations. |

## Complexity comparison

Let `m` be the number of characters in `a` and `n` the number of characters in `b`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Arithmetic Carry | `O(m + n)` | `O(max(m, n))` | Each input is traversed once, and the reversed result stores at most `max(m, n) + 1` characters before it becomes the returned string. |
| Binary Full Adder | `O(m + n)` | `O(m + n)` | Reversed copies of both inputs and the result are stored; each bit is processed once. |
