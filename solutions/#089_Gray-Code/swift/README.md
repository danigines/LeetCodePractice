## Explanation [_Optimal solution_]

Convert every binary integer from `0` through `2ⁿ - 1` directly into Gray code with:

``` text
gray(number) = number XOR (number shifted right by one bit)
```

``` swift
number ^ (number >> 1)
```

The shift aligns each binary bit with the bit immediately to its left. XOR records whether those neighboring binary bits differ, which produces consecutive Gray codes that change by exactly one bit.

Generating the converted value for every integer also produces each value exactly once, begins with `0`, and preserves the one-bit difference between the final and first values.

### How to Recognize This Pattern

Consider **Binary-to-Gray Conversion** when a sequence must enumerate all bit patterns while changing exactly one bit between consecutive values.

## Explanation [_Second solution_]

Build the sequence by reflection. Start with `[0]`. For each new bit:

1. Traverse the existing sequence in reverse order.
2. Set the new leading bit on every reflected value.
3. Append those values to the original sequence.

``` swift
for index in stride(from: result.count - 1, through: 0, by: -1) {
    result.append(leadingBit | result[index])
}
```

Reflection ensures the join differs by one bit, while reversing preserves one-bit transitions inside the appended half. The **Backtracking** topic represents another valid approach that visits unused one-bit neighbors; neither Swift solution needs a visited set because both construct the sequence deterministically.

## Comparing solutions

| Aspect | Optimal solution: Direct Conversion | Second solution: Reflection |
|:-------|:-----------------------------------:|:---------------------------:|
| Advantages | Produces each value independently with one formula. | Demonstrates how a valid sequence grows from the previous bit length. |
| Disadvantages | The conversion formula requires understanding the XOR relationship. | Requires reverse traversal while the result array is being expanded. |
| When to use it | When a concise bit-manipulation solution is preferred. | When deriving Gray code constructively is easier to explain. |
| Interview recommendation | Preferred for its simplicity and direct mathematical rule. | A strong alternative that makes the sequence invariant visual. |

## Complexity comparison

Let `n` be the number of bits and `N = 2ⁿ` the required number of output values.

| Solution | Time | Auxiliary Space | Reason |
|:---------|:----:|:---------------:|:-------|
| Direct Conversion | `O(N)` | `O(1)` | Each of the `N` output values is calculated once, and no storage beyond the required result is used. |
| Reflection | `O(N)` | `O(1)` | The sequence doubles until it contains `N` values, and values are appended directly to the required result. |
