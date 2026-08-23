## Comparing solutions

| Aspect | Optimal solution: Simulation | Second solution: Cycle Math |
|:-------|:-------:|:-------:|
| Advantages | Very intuitive; directly reproduces the zigzag; simple code. | It does not need to store separate rows and exploits the mathematical zigzag pattern. |
| Disadvantages | It maintains an arrangement of intermediate rows. | The formula for the diagonal indices is less obvious and more prone to errors. |
| When to use it | When the simulation clearly describes the rules of the problem. | When you want to iterate directly through the output row by row. |

## Complexity comparison
 Solution | Time | Space | Reason |
|:--------|:--------:|:--------:|:--------:|
| Simulation | `O(n)` | `O(n)` | Each character visits a row, and subsequently, all the rows are joined together. |
| Cycle Math | `O(n)` | `O(n)` | Each character is added once; `Array(s)` allows access via integer indices. |
