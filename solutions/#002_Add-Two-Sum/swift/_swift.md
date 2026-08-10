## Explanation [_Optimal solution_]
**What is a linked list?**
A linked list consists of nodes. Each node contains:
- a value;
- a reference to the next node.

In this problem:
```
2 → 4 → 3
```
represents:
```
342
```
because the digits are stored in reverse order.

This is convenient because traditional addition also starts with the least significant digit.

### Why do we use `%` and `/`?
If:
``` swift
let sum = 17
```
we can separate the result like this:
``` swift
sum % 10 = 7   // current digit
sum / 10 = 1   // carry
```
Since each node contains a single digit, this operation allows us to easily separate both parts.

### What does `?? 0` do?
The lists can have different lengths.
``` swift
let firstValue = firstNode?.val ?? 0
```
It means:
- use the node's value if it exists;
- use `0` if that list has already ended.

This way, we avoid handling the case where one list is longer separately.

### Why do we use a `dummyHead`?
The first node of the result often requires special handling.

A dummy node:
``` swift
let dummyHead = ListNode(0)
```
allows us to add all nodes in the same way.

When finished, we simply return:
``` swift
dummyHead.next
```
The initial `node (0)` is never part of the actual result.

### How to recognize this pattern
Look for this approach when:
- data represents individual digits
- you need to simulate manual addition or multiplication
- there is a value that must propagate to the next position
- the concept of a **carry** arises

The main pattern here is not specific to linked lists: it is a **digit-by-digit simulation**.

## Explanation [_Second solution_]
Instead of using a `while` loop, each recursive call:
1. processes the current nodes;
2. creates the corresponding digit;
3. passes the new carry;
4. proceeds to the next nodes.

Conceptually:
```
add(node1, node2, carry)
↓
add(next1, next2, newCarry)
↓
add(next1, next2, newCarry)
```
The termination condition occurs when:
- both lists have been exhausted
- and `carry == 0`

### Why is it less recommended?
It's elegant and compact, but each call must remain in the **call stack** until subsequent calls finish.

The iterative version avoids that cost and is often more appropriate for production and interviews.

### How to recognize the possibility of recursion
Linked lists naturally lend themselves to recursion because each node contains a reference to the next one.

When a problem can be expressed as:
> process this node and then solve the same problem for `next`

a recursive solution may be viable.

## Comparing solutions
| Aspect | Optimal solution: Iterative | Second solution: Recursive |
|:-------|:-------:|:-------:|
| Advantages | Linear time, constant auxiliary space, and explicit traversal control. | Compact code and a natural relationship with the structure of a linked list. |
| Disadvantages | It requires manually managing the pointers and the dummy node. | It consumes additional space on the call stack. |
| When to use it | Preferred option for potentially large lists and production code. | Useful when depth is limited or for practicing recursion. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| Iterative | `O(max(m, n))` | `O(1)` | Each node is processed once, and only references and temporary variables are maintained. |
| Recursive | `O(max(m, n))` | `O(max(m, n))` | It processes each node once but maintains a call on the stack for each position. |
