## Explanation [_Optimal solution_]
The area between two lines is calculated as:
```
width × min(leftHeight, rightHeight)
```
For example, using indices 1 and 8:
```
height[1] = 8
height[8] = 7

width = 8 - 1 = 7
height = min(8, 7) = 7

area = 7 × 7 = 49
```

### Why Two Pointers?
We start by using the widest possible span:
``` text
left                              right
↓                                   ↓
[1, 8, 6, 2, 5, 4, 8, 3, 7]
```
After calculating the area, we need to reduce the width by moving one of the pointers.

The important decision is **which pointer to move**.

### Why do we move the shorter line?
Let's assume:
```
leftHeight = 3
rightHeight = 8
```
The effective height of the container is:
```
min(3, 8) = 3
```
If we move the line with height `8`, we get:
- a smaller width;
- a height that remains limited by the `3`, unless something even smaller appears.

We cannot improve the area that way.

On the other hand, if we move the side with height `3`, there is a possibility of finding a taller line and compensating for the reduction in width.

That is the reasoning that allows us to discard many pairs without evaluating them.

### How to recognize the Two Pointers pattern
Consider this pattern when:
- you need to select a pair within an array
- an initial solution would involve trying all combinations
- you can start from both ends
- a specific property allows you to decide which side to discard

The essential aspect isn't simply having two pointers: it is being able to justify **why moving one of them does not rule out a potential optimal solution**.

## Explanation [_Second solution_]
This solution is based on a simple idea:

> If we don't know which two lines form the best container, let's try all pairs.

For each:
```
(left, right)
```
we calculate:
```
width = right - left
height = min(height[left], height[right])
area = width × height
```
and keep the maximum.

### How does it differ from the Two Pointers approach?
Brute force does not rule out any combinations.

If there are *n* lines, it compares approximately:
```
*n* × (*n* - 1) / 2
```
pairs.

The Two Pointers approach leverages the limiting height to decide which end to discard, reducing the traversal to linear time.

## Comparing solutions
| Aspect | Optimal solution: Two Pointers | Second solution: Brute Force |
|:-------|:-------:|:-------:|
| Advantages | `O(n)` time; constant space; discards combinations in a justified manner. | Very simple to derive and implement. |
| Disadvantages | It requires understanding why the lower side needs to be moved. | It evaluates a quadratic number of pairs. |
| When to use it | When a property allows one of the extremes to be discarded after each comparison. | As an initial solution or with very small inputs. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Two Pointers | `O(n)` | `O(1)` | Each pointer moves at most once per position. |
| Brute Force | `O(n²)` | `O(1)` | Evaluate all possible pairs of lines. |
