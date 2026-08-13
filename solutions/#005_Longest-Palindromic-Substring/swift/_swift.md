## Explanation
**What is Manacher's Algorithm?**
Manacher's is an algorithm specifically designed to find palindromes in a string in `O(n)` time.

Its main advantage is avoiding re-comparing characters that are already known to belong to another palindrome.

**First: we unify even- and odd-length palindromes.**
There are two types:
```
"aba"   // odd length
"abba"  // even length
```
We insert `#` between characters:
```
aba
↓
#a#b#a#
```
```
abba
↓
#a#b#b#a#
```
Now, both can be treated as palindromes with a single center.

The symbols `^` and `$` act as boundaries to avoid additional checks when reaching the ends.

## How to Recognize the Sliding Window Pattern
Manacher's algorithm is very specific.

Consider it when:
- the problem deals directly with **palindromes in strings**
- you need to find many palindromes or the longest one
- `O(n²)` is not sufficient
- you need a strictly linear solution.

### What does `radius` store?
For each position:
``` swift
radius[index]
```
we store how far the palindrome can expand around that center. For example, conceptually:
```
# a # b # a #
      ↑
    center
```
the radius indicates how many positions around the center remain symmetrical.

## Comparing solutions

| Aspect | Optimal solution: Manacher | Second solution: Expand Around Center |
|:-------|:-------:|:-------:|
| Advantages | Strictly linear time; avoids repetitive comparisons. | Much simpler, more intuitive, and easier to implement correctly. |
| Disadvantages | Complex and less obvious algorithm; higher risk of implementation errors. | It can reach `O(n²)`. |
| When to use it | When linear performance is required or very large strings are processed. | When `O(n²)` is acceptable and clarity and maintainability are prioritized. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Manacher | `O(n)` | `O(n)` | It reuses previously calculated radii and avoids repeating known expansions. |
| Expand Around Center | `O(n²)` | `O(n)` | It can expand up to O(n) from each center; the `array(s)` require(s) additional memory. |
