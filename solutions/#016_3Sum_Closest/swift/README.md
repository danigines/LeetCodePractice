## Explanation [_Optimal solution_]
This exercise is a direct extension of 3Sum.

We want:
```
a + b + c ≈ target
```
If we fix a:
```
b + c ≈ target - a
```
That is why we calculate:
``` swift
let pairTarget = target - sortedNums[index]
```
Now, the remaining problem is to find two numbers whose sum is as close as possible to `pairTarget`.

### Why do we sort?
After sorting, we can check the sum using two pointers:

```
anchor     left                 right
  ↓          ↓                    ↓
[-4, -1, 1, 2]
```

If:
```
pairSum < pairTarget
```
we need a larger sum, so:
``` swift
left += 1
```
If:
```
pairSum > pairTarget
```
we need a smaller sum:
``` swift
right -= 1
```

### How do we know which is the best answer?
We compare the absolute distance:
``` swift
abs(target - currentSum)
```
For example:
```
target = 5

sum = 3 → distance = 2
sum = 6 → distance = 1
```
Therefore, `6` is better.

We store a new answer only when its distance is smaller:
``` swift
if abs(target - currentSum) < abs(target - closestSum)
```

### Why do we return an exact match immediately?
If:
```
currentSum == target
```
then:
```
abs(target - currentSum) = 0
```
There is no better distance than `0`, so we can finish.

### How to recognize this pattern
When you encounter:
- three elements
- a target sum
- an `O(n³)` brute-force solution
- the possibility of sorting

ask yourself:
> Can I fix one element and turn the rest into a Two Sum problem?

Here the answer is yes, exactly like in `3Sum`.

## Explanation [_Second solution_]
Here we fix:
```
a + b
```
and calculate what the ideal third value would be:
```
c ≈ target - a - b
```
For example:
```
target = 10
a = 2
b = 3

needed = 5
```
Since the array is sorted, we use Binary Search to look for a number close to 5.

Each candidate yields:
```
currentSum = a + b + c
```
and we compare again:
```
abs(target - currentSum)
```

### How does this differ from the Two Pointers approach?

The optimal solution fixes one number:
```
O(n)
```
and finds the other two in:
```
O(n)
```
The alternative fixes **two** numbers:
```
O(n²)
```
and performs a binary search:
```
O(log n)
```
That is why it introduces an additional `log n` factor.

## Comparing solutions
| Aspect | Optimal solution: Two Pointers | Second solution: Binary Search |
|:-------|:-------:|:-------:|
| Advantages | `O(n²)`; fully exploits the ordering; clear reduction to Two Sum Closest. | Reinforces the pattern for searching for complements and Binary Search. |
| Disadvantages | It requires correctly justifying the `left` and `right` movement. | Add a `log n` factor and perform more searches. |
| When to use it | When an ordered sum makes it possible to decide which pointer to move. | Cuando quieres buscar explícitamente el tercer valor requerido. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Two Pointers | `O(n²)` | `O(1)` | Fix an element and find the best partner using a linear scan. |
| Binary Search | `O(n² log n)` | `O(1)` | Fix two elements and search for the third using binary search. |
