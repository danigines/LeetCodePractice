## Explanation [_Optimal solution_]
This problem is a classic example for Stack.

A **Stack** follows the rule:
```
Last In, First Out
```
The last element added is the first one that should be removed.

This exactly matches nested expressions:
```
([{}])
```
The last bracket we open:
```
{
```
must be the first one we close:
```
}
```

### A small design optimization
Instead of storing the opening bracket:
```
(
[
{
```
we directly store the closing bracket we expect:
```
( → )
[ → ]
{ → }
```
This way, when we find a closing character, we only need:
``` swift
stack.popLast() == character
```
No need for a `Dictionary` or multiple additional comparisons.

#### For:
```
s = "([])"
```
the stack evolves as follows:
```
'(' → [')']

'[' → [')', ']']

']' → [')']

')' → []
```

We end up with an empty stack, therefore:
```
true
```
Now:
```
s = "([)]"
```
we have:
```
'(' → [')']
'[' → [')', ']']
')' → expected ']' but received ')'
```
There is a mismatch and we return `false`.

### Why `popLast()`?

In Swift, an `array` works very well as a stack:
``` swift
stack.append(value)   // push
stack.popLast()       // pop
stack.last            // peek
```
`popLast()` also returns `nil` if the array is empty.

Therefore, this check handles two errors simultaneously:
``` swift
guard stack.popLast() == character else {
    return false
}
```
Two errors:
- there are no open brackets
- the bracket type does not match

### How to Recognize This Pattern
Think of a **Stack** when you encounter concepts like:
- balanced parentheses
- nested structures
- undo
- processing the most recently opened element
- the need to close elements in reverse order to which they were opened

The helpful question to ask yourself is:

> Do I need to remember the most recently opened element to process it before the previous ones?

If the answer is yes, a Stack is often a good candidate.

## Explanation [_Second solution_]
The logic of the Stack is the same, but we store:
```
(
[
{
```
instead of their respective closures.

Then we use:
``` swift
let openingByClosing: [Character: Character]
```
to map:
```
) → (
] → [
} → {
```
When we find:
```
]
```
we expect the last element of the Stack to be:
```
[
```
If it doesn't match, the string is invalid.

### What changes compared to the optimal solution?
The first solution directly stores what it **expects to find next**.

The second stores what it **found previously** and uses a `Dictionary` to translate the closing character.

Both are `O(n)`, but the first has fewer pieces and avoids the Hash Map.

## Comparing solutions
| Aspect | Optimal solution: Expected Closings Stack | Second solution: Opening Stack + Dictionary |
|:-------|:-------:|:-------:|
| Advantages | Very compact; no `Dictionary` needed; each closure is directly compared to what is expected. | The opening/closing relationship is made explicit and is easy to extend. |
| Disadvantages | It may initially seem less intuitive to save closures instead of openings. | It uses an additional structure that is not really necessary. |
| When to use it | When the set of brackets is small and you want to simplify the matching. | When you prefer to explicitly represent the pairs using a map. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Expected Closings Stack | `O(n)` | `O(n)` | Each character enters or leaves the Stack at most once. |
| Opening Stack + Dictionary | `O(n)` | `O(n)` | Traverse the string once and use constant searches on a fixed-size map. |
