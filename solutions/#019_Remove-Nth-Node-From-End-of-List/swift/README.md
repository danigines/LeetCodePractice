## Explanation [_Optimal solution_]
The difficulty lies in the fact that `n` is counted **from the end**, but a singly linked list only allows forward traversal.

The solution avoids first calculating the length by using two pointers.

**1. Create a `dummy`**
``` swift
let dummy = ListNode(0, head)
```
Conceptually:
```
dummy → 1 → 2 → 3 → 4 → 5
```
This especially simplifies the case where we need to remove the original head.

**2. Create a separation between `fast` and `slow`**

Both start in `dummy`.

Advance `fast` `n + 1` positions:
``` swift
for _ in 0...n
```
For:
```
1 → 2 → 3 → 4 → 5
n = 2
```
There is enough separation so that `slow` ends just before node `4`.

**3. Advance both together**
``` swift
while fast != nil
```
Move both pointers one position.

When `fast` reaches the end:
```
slow → node before target
```
Then delete the next node:
``` swift
slow?.next = slow?.next?.next
```
For example:
```
3 → 4 → 5
```
becomes:
```
3 ─────→ 5
```

### Why do we use `n + 1` spacing?

Because we need `slow` to finish before the node we want to delete, not on top of it.

This allows us to modify:
``` swift
slow.next
```
directly.

### How to recognize this pattern
Think of **Fast & Slow Pointers with a fixed distance** when:
- you need to find something near the end of a linked list
- you don't want to calculate its length first
- you want to do it in a single pass
- you need to maintain a constant distance between two positions

## Explanation [_Second solution_]
First, we calculate how many nodes there are.

If:
```
length = 5
n = 2
```
we want to remove the second node from the end.

Its position from the beginning is:
```
length - n = 3
```
Using the `dummy` node, we move forward `3` times to position ourselves just before the target node.

Then we perform the same removal:
``` swift
previous?.next = previous?.next?.next
```

### What changes compared to the optimal solution?
The logic is more straightforward, but it requires two phases:
- counting nodes
- traversing again to the correct position

The solution using Fast & Slow Pointers achieves that position in a single traversal.

## Comparing solutions
| Aspect | Optimal solution: Fast & Slow Pointers | Second solution: Two Passes |
|:-------|:-------:|:-------:|
| Advantages | One pass only; follows up; uses constant spacing. | Very simple to reason and implement. |
| Disadvantages | The separation of `n + 1` may be less intuitive initially. | You need to go through the list in two phases. |
| When to use it | When you need to locate a position from the end in a single pass. | When simplicity is more important than reducing travel distances. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Fast & Slow Pointers | `O(L)` | `O(1)` | It maintains a fixed separation and locates the node in a single pass. |
| Two Passes | `O(n)` | `O(1)` | Cuenta los nodos y luego recorre nuevamente hasta la posición necesaria. |

_Let `L` be the number of nodes._
