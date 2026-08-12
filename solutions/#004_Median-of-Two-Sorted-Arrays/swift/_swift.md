## Explanation
**First: what is the median?**

In an ordered set:
- If there is an odd number of elements, the median is the middle element.
- If there is an even number, it is the average of the two middle elements.

For example:
```
[1, 2, 3]
    ↑
Median = 2
```
```
[1, 2, 3, 4]
      ↑ ↑
Median = (2 + 3) / 2
```
The challenge is to find those elements without combining the two arrays.

## Explanation [_Optimal solution_]
**Main idea: partition both arrays**

We want to partition both arrays so that there is a left half and a right half:
```
Left half | Right half
```
such that:
```
all values ​​on the left
<=
all values ​​on the right
```
Let's assume:
``` swift
nums1 = [1, 3]
nums2 = [2]
```
A valid partition would conceptually be:
```
nums1: [1] | [3]
nums2: [2] | []
```
The left half contains:
```
[1, 2]
```
and the right half:
```
[3]
```
The largest value on the left is `2`, which is the median.

### What do we need to compare?
We don't need to check every element. Only the values ​​around each partition matter:
```
firstLeft  | firstRight
secondLeft | secondRight
```
The partition is correct when:
``` swift
firstLeft <= secondRight
secondLeft <= firstRight
```
If both conditions are met, we know that no value from the left half belongs on the right.

### Why Binary Search?
We choose a cut position in `nums1`.

The corresponding position in `nums2` is automatically calculated to maintain the correct number of elements in the left half. If:
```
firstLeft > secondRight
```
we have taken too many elements from `nums1`, so we move the partition to the left. If the opposite occurs, we move it to the right.

This behavior allows for the use of **Binary Search**.

### What do `Int.min` and `Int.max do?
A partition can be before the first element:
```
[] | [1, 2]
```
or after the last one:
```
[1, 2] | []
```
In those cases, there is no actual value on one of the sides. We use:
``` swift
Int.min
Int.max
```
as boundary values ​​to avoid multiple special cases.

### How to recognize this pattern
Consider Binary Search on a partition when:
- you have two sorted collections
- you need to find a position or boundary
- you cannot afford to iterate through all the elements
- you can determine whether a partition is too far to the left or right

## Explanation [_Second solution_]
Since both arrays are already sorted, we can move forward using two pointers:
```
nums1: [1, 3]
        ↑

nums2: [2]
        ↑
```
At each step, we choose the smallest available value. For:
```
nums1 = [1, 2]
nums2 = [3, 4]
```
the resulting order would be:
```
1 → 2 → 3
```
We do not need to continue to `4`, because we have already reached the middle elements.

### Why do we store `previousValue` and `currentValue`?
If the total number of elements is even, we need the two middle values. For example:
```
[1, 2, 3, 4]
    ↑  ↑
```
Upon reaching the middle position:
```
previousValue = 2
currentValue = 3
```
and we calculate:
```
(2 + 3) / 2
```

## Comparing solutions
| Aspect | Optimal solution: `Binary Search` | Second solution: `Merge` |
|:-------|:-------:|:-------:|
| Advantages | Achieves `O(log(m + n))`; does not traverse all elements; constant space. | Much simpler to reason about; it directly takes advantage of the fact that both arrays are sorted. |
| Disadvantages | The partitioning logic is considerably more complex. | Linear time; it does not meet the complexity required by the problem. |
| When to use it | When you need to fully leverage the ordering of the arrays and there is a logarithmic requirement. | When simplicity is a priority and `O(m + n)` is acceptable. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| `Binary Search` | `O(log(min(m, n)))` | `O(1)` | Reduce a la mitad el espacio de posibles particiones en cada iteración. |
| `Merge` | `O(n)` | `O(1)` | Advance sequentially through both arrays until the median position is reached. |
