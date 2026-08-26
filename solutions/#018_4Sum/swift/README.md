## Explanation [_Optimal solution_]
This problem continues the idea we saw in `3Sum`.

We want:
```
a + b + c + d = target
```
If we fix a and b, there are only two numbers left to find:
```
c + d = target - a - b
```
Here we can use **Two Pointers**.

**1. We sort the array**

For example:
```
[1, 0, -1, 0, -2, 2]
```
becomes:
```
[-2, -1, 0, 0, 1, 2]
```
This gives us two advantages:

we can shift left and right according to the sum;

we can detect duplicates by comparing neighboring values.

**2. We set two anchors**

We have:
```
first   second      left          right
  ↓       ↓           ↓             ↓
[-2,     -1,          0, 0, 1,     2]
```
`first` and `second` remain fixed while we search for the other two values.

**3. We move left and right**

We calculate:
```
sum = a + b + c + d
```
If:
```
sum < target
```
we need to increase the sum:
``` swift
left += 1
```
If:
```
sum > target
```
we need to decrease it:
``` swift
right -= 1
```
And if:
```
sum == target
```
we store the quadruple.

### How do we avoid duplicates?
We must eliminate duplicates at three levels:
- repeated `first` values
- repeated `second` values
- repeated `left` and `right` values ​​after finding a response

For example:
```
[2, 2, 2, 2, 2]
```
should only generate:
```
[[2, 2, 2, 2]]
```

### Why do we use `Int64`?

The elements can have values ​​up to:
```
10⁹
```
Four values ​​could add up to:
```
4 × 10⁹
```
That would exceed a 32-bit signed integer.

In LeetCode, Swift normally executes `Int` as 64 bits, but explicitly converting the sum to `Int64` documents the intention and makes the reasoning safe from overflow.

### When you see problems like:
```
2Sum
3Sum
4Sum
kSum
```
think about progressively reducing the number of elements:

```
4Sum
 ↓ fix one
3Sum
 ↓ fix one
2Sum
```

Once we get to Two Sum on sorted data, Two Pointers efficiently solves the rest.

## Explanation [_Second solution_]
Here we fix:
```
a + b + c
```
and calculate exactly what value we need as `d`:
```
d = target - a - b - c
```
Since the array is sorted, we search for `d` using **Binary Search**.

For example:
```
target = 0
a = -2
b = -1
c = 1
```
then we need:
```
d = 0 - (-2) - (-1) - 1
  = 2
```
We search for `2` in the remaining part of the array.

### Why do we use a `Set`?
Since this version doesn't remove duplicates at each level of the traversal, we use:
``` swift
Set<[Int]>
```
to store only unique quadruples.

This simplifies the logic, but uses more memory.


### What changes compared to Two Pointers?

The main solution fixes two elements and finds the last two in `O(n)`.

This alternative fixes three elements and finds the fourth in `O(log n)`:
```
Two Pointers:
O(n² × n) = O(n³)

Binary Search:
O(n³ × log n) = O(n³ log n)
```
That's why it's less efficient.

## Comparing solutions
| Aspect | Optimal solution: Two Pointers | Second solution: Binary Search |
|:-------|:-------:|:-------:|
| Advantages | `O(n³)`; natural duplicate control; direct extension of 3Sum. | Conceptually simple: set three values ​​and find the fourth. |
| Disadvantages | It requires controlling duplicates at several levels. | Add `log n` and you need a `Se`t to simplify duplicates. |
| When to use it | When you can sort and reduce the problem to Two Sum. | When you want to practice searching for plugins using Binary Search. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Two Pointers | `O(n³)` | `O(1)` | Fix two values ​​and find the other two using a linear path. |
| Binary Search | `O(n³ log n)` | `O(k)` | Set three values ​​and search for the fourth using Binary Search. |
