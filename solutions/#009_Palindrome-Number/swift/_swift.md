## Explanation [_Optimal solution_]
The key idea is that we **don't need to reverse the entire number**. We can reverse only the right half and compare it with the left half.

For example:
```
1221
```
We start with:
``` text
remaining = 1221
reversedHalf = 0
```
We move digits from the right:
``` text
1221 → 122     reversedHalf = 1
122  → 12      reversedHalf = 12
```
Now:
```
remaining == reversedHalf
12 == 12
```
Therefore, it is a palindrome.

### Cases we can immediately rule out
Any negative number returns false:
```
-121
```
The minus sign `(-)` can never appear at the end.

We also rule out positive numbers that end in `0`:
``` text
10
120
```
If they were to be palindromes, they would also have to start with `0`, something integers do not represent.

The only exception is: **`0`** which is indeed a palindrome.

### What happens with an odd number of digits?
For:
```
12321
```
upon stopping, we might have:
```
remaining = 12
reversedHalf = 123
```
The `3` is the middle digit and does not matter for determining whether the number is a palindrome.

That is why we compare:
``` swift
remaining == reversedHalf / 10
```
which removes that middle digit.

### How to recognize this approach
When a numerical problem asks about symmetry between the ends, consider:
- extracting digits using `% 10`
- removing them using `/ 10`
- comparing parts of the number without converting it to a string

This exercise directly reuses the digit manipulation concepts we saw in **`Reverse Integer`**.

## Explanation [_Second solution_]
Here, we treat the number as a sequence of characters.

For:
```
121
```
we compare:
``` text
1 2 1
↑   ↑
```
If both ends match, we move toward the center.
``` text
1 2 1
  ↑
```
If we find a difference, we return false.

### How does this differ from the optimal solution?
The arithmetic solution works directly with the number and uses constant space.

This version:
``` swift
Array(String(x))
```
creates an additional representation of all the digits.

It is easier to read, but it does not meet the follow-up requirement of solving the problem without converting to a `String`.

## Comparing solutions
| Aspect | Optimal solution: Reverse Half | Second solution: String + Two Pointers |
|:-------|:-------:|:-------:|
| Advantages | `O(1)` space; avoids reversing the entire number; satisfies the follow-up requirement. | Very simple to implement and understand. |
| Disadvantages | It requires understanding the special case of odd numbers. | Use additional memory and convert the integer to text. |
| When to use it | When a purely arithmetic and efficient solution is desired. | When conversion to `String` is permitted and simplicity is prioritized. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Reverse Half | `O(log₁₀ n)` | `O(1)` | It processes only part of the digits and does not create additional structures. |
| String + Two Pointers | `O(log₁₀ n)` | `O(log₁₀ n)` | It converts all the digits into characters and stores them in an array. |
