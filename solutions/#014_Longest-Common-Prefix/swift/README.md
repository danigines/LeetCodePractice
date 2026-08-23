## Explanation [_Optimal solution_]
The strategy is **Horizontal Scanning**.

We start by assuming the entire first string could be the common prefix:
```
["flower", "flow", "flight"]

prefix = "flower"
```
Then, we compare it with each subsequent string.

**Comparison** with `"flow"`
```
"flow".hasPrefix("flower") → false
```
We shorten the candidate:
```
flower
flowe
flow
```
Now:
```
"flow".hasPrefix("flow") → true
```
The candidate becomes:
```
"flow"
Comparison with "flight"
"flight".hasPrefix("flow") → false
```
We shorten it again:
```
flow
flo
fl
```
Now:
```
"flight".hasPrefix("fl") → true
```
The final answer is:
```
"fl"
```

### Why does it work?
Because after processing each string, `prefix` represents the common prefix of all the strings seen up to that point.

And there is an important property:

> When we add another string, the common prefix can only remain the same or become shorter.

We never need to extend `prefix` again.

### Key Swift APIs
`dropFirst()` avoids re-comparing the first string with itself:
``` swift
for string in strs.dropFirst()
```
`hasPrefix()` directly checks if a string starts with another:
``` swift
string.hasPrefix(prefix)
```
And `removeLast()` removes a `Character` from the end of the candidate:
```
flower → flowe → flow → flo
```

### How to recognize this pattern
Horizontal Scanning is useful when:
- you have multiple sequences
- you maintain a valid candidate
- each new element can reduce that candidate
- the solution never needs to grow again

Here, the state we maintain is simply:
```
current common prefix
```

## Explanation [_Second solution_]
Instead of reducing a whole candidate, this solution compares the strings **column by column**.

For:
```
flower
flow
flight
```
we first check:
```
f
f
f
```
They all match.

Next:
```
l
l
l
```
They also match.

At the next position:
```
o
o
i
```
there is a difference.

That is why the prefix ends at:
```
"fl"
```

### How does it differ from Horizontal Scanning?
Horizontal Scanning asks:

> Which part of my candidate remains valid?

Vertical Scanning asks:

> Is this character still common across all strings?

Both arrive at the same answer and have similar complexity.

The Horizontal version tends to be more compact in Swift thanks to:
``` swift
hasPrefix()
```
and it avoids directly handling `String.Index`.

## Comparing solutions
| Aspect | Optimal solution: Horizontal Scanning | Second solution: Vertical Scanning |
|:-------|:-------:|:-------:|
| Advantages | compact code; use `hasPrefix()`; the candidate only shrinks. | Reasoning based on positions is straightforward and easy to visualize. |
| Disadvantages | `hasPrefix()` may re-examine part of the candidate as it is reduced. | Working with `String` positions in Swift is more cumbersome than working with arrays. |
| When to use it | When you can maintain and progressively narrow down a candidate. | When you want to explicitly compare the same position across multiple sequences. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Horizontal Scanning | `O(n × m)` | `O(1)` | It progressively reduces a candidate prefix and compares it with each string. |
| Vertical Scanning | `O(n × m)` | `O(1)` | Compare each possible position of the prefix against all the strings. |
