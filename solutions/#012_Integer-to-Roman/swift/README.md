## Explanation [_Optimal solution_]
The idea is to also treat the special cases:
``` text
900 = CM
400 = CD
90  = XC
40  = XL
9   = IX
4   = IV
```
as standard Roman values.
> Then, we arrange them from largest to smallest.

For each value, we ask:

Does this value still fit within the remaining number?

If the answer is yes:
1. we add its symbol
2. we subtract its value
3. we repeat as long as it remains possible

### Why does the greedy approach work here?
At each step, we choose the valid Roman numeral with the highest possible value.

This works because the Roman numeral system used in the problem has a fixed set of valid representations, explicitly including subtractive combinations.

By including `900`, `400`, `90`, `40`, `9` and `4`, we avoid generating incorrect forms such as:
``` text
IIII
VIIII
XXXX
```

### How to recognize a Greedy approach
Consider a Greedy approach when:
- you need to build a solution gradually
- there is a clearly better option at each step
- choosing that option does not prevent you from reaching the correct solution
- values ​​can be processed in a natural order, typically from largest to smallest

The key question here is:
> What is the largest Roman numeral I can use right now?

## Explanation [_Second solution_]
This solution takes advantage of the fact that each decimal position has a small, known set of possibilities.

For example, for the hundreds place:
``` text
0 → ""
1 → C
2 → CC
3 → CCC
4 → CD
5 → D
6 → DC
7 → DCC
8 → DCCC
9 → CM
```
For:
```
1994
```
we extract:
```
Thousands = 1
Hundreds  = 9
Tens      = 9
Ones      = 4
```
and look up directly:
```
1 → M
9 → CM
9 → XC
4 → IV
```
Result:
```
MCMXCIV
```

### How does this differ from the Greedy approach?
The Greedy approach constructs the solution by processing values ​​from largest to smallest.

This alternative requires no decision-making during execution: each decimal digit is converted using a predefined table.

It is highly efficient, but relies heavily on the range and Roman numeral rules being limited and well-defined.

## Comparing solutions
| Aspect | Optimal solution: Greedy | Second solution: Decimal Lookup |
|:-------|:-------:|:-------:|
| Advantages | It generalizes the Roman system well; it directly reflects the choice of the highest valid value. | Very compact, with direct access to each decimal position. |
| Disadvantages | It requires going through a table and understanding why the greedy approach is valid. | It relies on specific tables and is less widespread. |
| When to use it | When you want to model the problem using greedy values ​​and decisions. | When the domain is small, fixed, and can be easily precalculated. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Greedy | `O(1)` | `O(1)` | The input range and the symbol table have a fixed size. |
| Decimal Lookup | `O(1)` | `O(1)` | It only processes the four decimal places using constant tables. |
