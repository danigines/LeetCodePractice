## Explanation [_Optimal solution_]
The solution works like a small **parser** that proceeds through various stages:
```
Leading spaces → Optional sign → Digits → Stop
```
### 1. Ignore leading spaces
As long as parsing has not yet begun:
``` swift
if character == " " {
continue
}
```
we can ignore spaces.

However, once a sign or a digit is encountered, a space terminates the conversion.

For example:
``` text
"   42"  → 42
"42 10"  → 42
```

### 2. Process the sign only once
The sign is valid only before reading any digits:
``` text
"-42"  → -42
"+42"  → 42
```
But:
```
"42-10"
```
stops at '-' and returns 42.

### 3. Reading digits
Swift provides `wholeNumberValue`, which returns the numeric value represented by a `Character`; given the constraints of this problem, we work with the digits 0–9.

For example:
``` text
"4" → 4
"2" → 2
```
We construct the number like this:
``` text
value = value * 10 + digit
```
For `"42"`:
``` text
0
0 * 10 + 4 = 4
4 * 10 + 2 = 42
```

### 4. Check for overflow before constructing the value
Just as with `Reverse Integer`, we do not want to wait until we have an invalid value.

Before:
``` swift
value = value * 10 + digit
```
we check whether that next step would exceed the limit.

For positive numbers:
```
2147483647
```
For negative numbers, we allow a magnitude of:
```
2147483648
```
because:
```
-2147483648
```
is the valid lower limit.

If the limit is exceeded, we immediately return the corresponding extreme value.

### How to recognize this pattern
Consider sequential parsing when the problem defines rules such as:
- first, process A
- then, optionally B
- then, consume C as long as it is valid
- stop when conditions change.

It is not advisable to search for characters arbitrarily: **the order in which they appear matters.**

## Explanation [_Second solution_]
This solution represents the rules from the problem statement very explicitly.

We have three independent phases:
``` text
1. Skip whitespace
2. Read sign
3. Read digits
```
Example

For:
```
"   -042abc"
```
The index progresses as follows:
```
"   -042abc"
 ↑↑↑           skip spaces

"   -042abc"
    ↑          read '-'

"   -042abc"
     ↑↑↑       read 042

"   -042abc"
        ↑      'a' stops parsing
```
Result:
```
-42
```

### What changes compared to the optimal solution?
The numerical logic is practically the same. The difference lies in how we traverse the string:
- The optimal solution iterates directly over the `String`.
- This solution first creates an `Array` from the string to allow access via integer indices.

This makes the phases very clear, but it requires additional memory.

## Comparing solutions
| Aspect | Optimal solution: Single-pass | Second solution: Indexed phases |
|:-------|:-------:|:-------:|
| Advantages | `O(1)` auxiliary space; a single pass; avoids additional conversions. | The phases of the algorithm are very clear and correspond directly to the problem statement. |
| Disadvantages | It requires monitoring the state via `parsingStarted`. | `Array(s)` uses additional memory. |
| When to use it | When we want a compact and efficient parser. | When explicitly separating the stages improves readability. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Single-pass | `O(n)` | `O(1)` | Each character is processed at most once without creating a copy of the string. |
| Indexed phases | `O(n)` | `O(n)` | The traversal remains linear, but `Array(s)` stores all the characters. |
