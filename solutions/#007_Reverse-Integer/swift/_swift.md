## Explanation [_Optimal solution_]
The idea is to move the digits one by one from `x` to `reversed`.

**Extract the last digit** using:
``` swift
let digit = remaining % 10
```
if we have:
```
remaining = 123
```
we get:
```
digit = 3
```
Then:
``` swift
remaining /= 10
```
removes that last digit:
```
123 → 12
```
To build the reversed number, we use:
```
reversed = reversed * 10 + digit
```
Example:
```
0   → 3
3   → 32
32  → 321
```
### The key point: overflow
The allowed range is:
```
-2147483648 ... 2147483647
```
We cannot first perform:
``` swift
reversed * 10 + digit
```
and check afterwards, because by then, the overflow might have already occurred.

We must first ask:
> Will multiplying `reversed` by 10 and adding this digit remain within the range?

For the positive limit:
```
2147483647
         ↑
last valid digit = 7
```
If `reversed` is already greater than `214748364` multiplying it by 10 would cause an overflow.

And if it is exactly `214748364`, the next digit cannot be greater than `7`.

The same reasoning applies to the negative limit, where the last allowed digit is `-8`.

### How to recognize this pattern
This approach appears in problems where you need to:
- process a number digit by digit
- get the last digit using `% 10`
- remove it using `/ 10`
- reconstruct another number
- handle overflow during that reconstruction

## Explanation [_Second solution_]
This solution completely changes the strategy: instead of manipulating the digits mathematically, it treats them as characters.

For:
```
x = -120
```
we first separate the sign:
```
"120"
```
reverse it:
```
"021"
```
and remove the leading zeros:
```
"21"
```
Then we restore the sign:
```
"-21"
```

### How do we handle overflow?
Before converting the result back to an Int, we compare it against:
```
Positive: "2147483647"
Negative: "2147483648"
```
First, we compare the number of digits.

If both have the same length, we can perform a lexicographical comparison because they contain only digits and have the same number of characters.

### How does it differ from the optimal solution?
The mathematical version:
- does not require type conversion
- uses constant space
- works directly with the digits
- better reflects what this exercise typically aims to evaluate

The string-based version is more visually intuitive but requires additional memory.

## Comparing solutions
| Aspect | Optimal solution: Arithmetic | Second solution: String |
|:-------|:-------:|:-------:|
| Advantages | `O(1)` space; directly manipulates the digits; checks for overflow before it occurs. | Very intuitive and easy to visualize. |
| Disadvantages | Overflow validation requires more reasoning. | Crea strings adicionales y depende de conversiones. |
| When to use it | When the problem requires efficient numerical manipulation or restricts larger types. | When text conversions are permitted and simplicity is prioritized. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Arithmetic | `O(log₁₀ n)` | `O(1)` | Processes each digit once without creating additional structures. |
| String | `O(log₁₀ n)` | `O(n)` | Procesa los mismos dígitos, pero los almacena en strings adicionales. |
