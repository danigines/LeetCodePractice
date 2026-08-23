## Explanation [_Optimal solution_]
The connection to Two Sum is the core aspect.

We want:
```
a + b + c = 0
```
If we fix *a*, the remaining problem is:
```
b + c = -a
```
In other words, it becomes a search for two elements.

**1. First, we sort the array.**

For example:
```
[-1, 0, 1, 2, -1, -4]
```
becomes:
```
[-4, -1, -1, 0, 1, 2]
```
This allows us to use two pointers:
```
anchor      left              right
  ↓           ↓                 ↓
[-4, -1, -1, 0, 1, 2]
```
**2. We fix a number**

For each index, we treat:
``` swift
sortedNums[index]
```
as the first element of the triplet.

Then, we look for the other two among the remaining elements.

**3. Move the pointers based on the sum**

If:
```
sum < 0
```
we need a larger sum.

Since the array is sorted:
``` swift
left += 1
```
moves us to a larger value.

If:
```
sum > 0
```
we need to reduce it:
``` swift
right -= 1
```
If:
```
sum == 0
```
we have found a valid triplet.

### How do we avoid duplicates?
This is one of the most important points of the exercise.

First, we avoid using the same value as an anchor multiple times:
``` swift
if index > 0 && sortedNums[index] == sortedNums[index - 1] {
    continue
}
```
After finding a solution, we also skip duplicate values ​​for `left` and `right`.

For example:
```
[-2, 0, 0, 0, 2, 2]
```
we want to get:
```
[-2, 0, 2]
```
only once.

### Why can we stop if the first number is positive?
After sorting:
```
[1, 2, 3, 4]
```
if the anchor is already positive, all subsequent numbers are positive as well.

So:
```
positive + positive + positive > 0
```
and we can never get 0.

That is why:
``` swift 
if sortedNums[index] > 0 {
    break
}
```
avoids unnecessary work.

### How to recognize this pattern
When you see:
- a search for triplets
- a target sum
- a need to avoid `O(n³)`
- the possibility of sorting

think about:

> Fixing one element and turning the rest into a Two Sum problem.

## Explanation [_Second solution_]
Here, we continue by fixing the first number:
```
a + b + c = 0
```
but we solve:
```
b + c = -a
```
using a Set, similar to the complement concept in Two Sum.

For each second number:
``` swift
let complement = -sortedNums[index] - secondValue
```
we ask:
```
have we already seen that complement?
```
If so, we have a valid triplet.

**Example**

With:
```
[-4, -1, -1, 0, 1, 2]
```
if we fix:
```
anchor = -1
```
and then:
```
secondValue = 1
```
we need:
```
complement = -(-1) - 1
           = 0
```
If `0` is already in `seen`, we get:
```
[-1, 0, 1]
```

### How does it differ from the Two Pointers approach?
Both solutions reduce 3Sum to Two Sum.

The difference lies in how they solve that Two Sum problem:
-**Two Pointers**: leverages the sorted array.
-**Hash Set**: looks for complements using hashing.

Both achieve `O(n²)` complexity, but Two Pointers avoids creating a new `Set` for each anchor and makes handling duplicates much easier.

## Comparing solutions
| Aspect | Optimal solution: Sorting + Two Pointers | Second solution: Hash Set |
|:-------|:-------:|:-------:|
| Advantages | `O(n²)`; minimal auxiliary space; natural handling of duplicates; fully exploits the ordering. | It directly reuses the "complement" idea from Two Sum. |
| Disadvantages | It requires careful reasoning regarding the movement of the pointers and the duplicates. | Usa memoria adicional y el manejo de duplicados resulta menos elegante. |
| When to use it | When the arrangement can be ordered and you need to find unique combinations. | When you want to explicitly reduce each iteration to a Two Sum problem using hashing. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Sorting + Two Pointers | `O(n²)` | `O(1)` auxiliar* | One element is fixed, and the other two are sought using a linear search. |
| Hash Set | `O(n²)` | `O(n)` | For each anchor, the remaining ones are iterated over, and values ​​are stored in a `Set`. |
