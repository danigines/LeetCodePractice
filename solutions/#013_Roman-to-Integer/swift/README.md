## Explanation [_Optimal solution_]
The essential rule of Roman numerals is:

- If a symbol is equal to or greater than the one that follows it, it is added.
- If it is smaller, it is subtracted.

For example:
```
VI
```
Since:
``` text
V = 5
I = 1
```
we get:
```
5 + 1 = 6
```
But in:
```
IV
```
I appears before a larger value:
```
1 < 5
```
so:
```
5 - 1 = 4
```

### Why traverse from right to left?
This way, we can simply keep the last processed value:
``` swift
var previousValue = 0
```
For:
```
MCMXCIV
```
we go through:
```
V → I → C → X → M → C → M
```
The initial operations would be:
``` text
V = 5     → +5
I = 1     → -1   porque 1 < 5

C = 100   → +100
X = 10    → -10  porque 10 < 100
```
The same rule automatically detects:
```
IV
IX
XL
XC
CD
CM
```
sin escribir condiciones especiales para cada combinación.

### Where does the hash table appear?
Here:
``` swift
let values: [Character: Int]
```
It is a `Dictionary`.

It allows us to quickly convert:
``` text
"M" → 1000
"C" → 100
"V" → 5
```
The table has only seven entries, so its size is constant.

### How to recognize this approach
When a value depends on the relationship with its neighbor, ask:

> Does changing the direction of the traversal simplify the decision?

In this case, traversing from the right makes it possible to decide whether to add or subtract using only a previous value.

## Explanation [_Second solution_]
This solution directly examines pairs of symbols.

For:
```
MCMXCIV
```
we start with:
```
M C
```
Since:
```
1000 > 100
```
`M` is added normally.

Next, we look at:
```
C M
```
Since:
```
100 < 1000
```
we have a subtractive combination:
```
CM = 1000 - 100 = 900
```
Then we consume both characters:
``` swift
index += 2
```
The same logic detects `XC` and `IV`.

### How does this differ from the optimal solution?
The first solution processes one character at a time, starting from the right.

This one processes from the left and needs to look at:
```
current + next
```
That is why we convert the `String` into a `[Character]` array, making it easier to access elements using integer indices.

The logic remains linear, but it uses additional memory.

## Comparing solutions
| Aspect | Optimal solution: Right-to-Left | Second solution: Left-to-Right |
|:-------|:-------:|:-------:|
| Advantages | A single rule for addition/subtraction; `O(1)` space; no lookahead required. | Very close to the traditional way of interpreting pairs such as `IV`, `XC`, or `CM`. |
| Disadvantages | Navigating in reverse can be less intuitive at first. | You need to check the next character and, in this Swift implementation, create `Array(s)`. |
| When to use it | When comparing with the previously processed value simplifies the logic. | When you prefer to explicitly identify the subtractive pairs. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Right-to-Left | `O(n)` | `O(1)` | Each symbol is processed once, and the map always has seven entries. |
| B | `O(n)` | `O(n)` | The traversal is linear, but `Array(s)` creates a copy of the characters. |
