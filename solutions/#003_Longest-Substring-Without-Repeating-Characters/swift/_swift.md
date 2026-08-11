## Pattern/Technique Explanation
**What is the Sliding Window technique?**

The Sliding Window maintains a contiguous range within a collection:
`[ windowStart ... currentIndex ]`

In this problem, that window represents the current substring containing **no repeating characters**.
The right pointer advances automatically as we traverse the string. The left pointer (`windowStart`) only moves when we encounter a duplicate.

## How to Recognize the Sliding Window Pattern
Consider this pattern when the problem mentions:
- a **substring** or **subarray**
- **contiguous** elements
- longest / shortest
- a condition that must be maintained within a range

A useful question to ask is:
> Can I expand a range and adjust its start point only when it ceases to be valid?

If the answer is yes, Sliding Window is likely a good candidate.

## Explanation [_Optimal solution_]
**Main idea**
We store the last position where each character appeared in a Dictionary:
```
character → last index
```
For:
```
s = "abcabcbb"
```
upon reaching the second `"a"`, we know the previous one appeared at index `0`.
The current window was:
```
abc
```
Therefore, we move its start to after the previous `"a"`:
```
abc a
 ↑
 new start
```
``` swift
windowStart = previousIndex + 1
```

### Why do we check `previousIndex >= windowStart`?
Because a character might have appeared previously but is already outside the current window. For example:
```
s = "abba"
```
When we reach the last `"a"`, its previous occurrence is at index `0`, but the window already starts further along.

We must not move `windowStart` backwards. That is why we use:
``` swift
previousIndex >= windowStart
```
The window always moves forward; it never moves backward.

### Why do we use a `enumerated()`?
`String.enumerated()` provides us with:
``` swift
(index, character)
```
Here, we use that index solely to calculate distances and store positions.

This avoids accessing the `String` using integer indices—something Swift does not directly allow, as `Strings` operate using `String.Index`.

## Explanation [_Second solution_]
The window must once again contain only unique characters. The difference is that now a `Set` tells us:

> Does this character already exist within the current window?

If it does, we shrink the window from the left:
``` swift
while charactersInWindow.contains(characters[windowEnd])
```
until the duplicate is removed.

Then we add the new character and calculate the length. Example

For:
```
s = "pwwkew"
```
we initially reach:
```
pw
```
Upon encountering another `"w"`:
```
pww
↑ duplicate
```
we remove characters from the left until the first "w" leaves the window.

The window becomes valid again, and we can continue.

### What changes compared to the optimal solution?
The dictionary knows exactly **where a character last appeared**.

That is why it can move `windowStart` directly:
``` swift
windowStart = previousIndex + 1
```
The `Set`, on the other hand, only knows whether the character exists. It must remove elements one by one until a valid window is restored.

Both solutions are linear, but the `Dictionary` based approach tends to be more direct for this problem.

## Comparing solutions
| Aspect | Optimal solution: `Dictionary` | Second solution: `Set` |
|:-------|:-------:|:-------:|
| Advantages | Skip directly past the duplicate and avoid converting the `string` into an array. | The logic behind maintaining a valid window is highly visual and easy to reason through. |
| Disadvantages | It also requires storing the last position of each character. | It removes characters one by one and creates an `array` (or `arrays`) to facilitate indexing. |
| When to use it | When knowing the last position allows the window to be moved directly. | When we only need to know which elements exist in the window. |

## Complexity comparison
| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:------:|
| `Dictionary` | Average `O(n)` | `O(min(n, k))` | Each character is processed once, and the dictionary allows skipping directly past the duplicate. |
| `Set` | Average`O(n)` | `O(n)` | Cada carácter entra y sale de la ventana como máximo una vez; además se crea `array(s)`. |
