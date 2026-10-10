## Explanation [_Optimal solution_]

First apply two inexpensive pruning rules:

1. Count the characters on the board and reject the search if any character required by `word` is unavailable in sufficient quantity.
2. Start from the rarer end of `word`, reversing the search order when its final character appears less often than its first character.

Then start a depth-first search from every cell matching the first required character. At each step, compare the cell immediately, mark its encoded position as visited, and explore its four neighbors.

``` swift
func search(_ row: Int, _ column: Int, _ index: Int) -> Bool {
    guard board[row][column] == letters[index] else {
        return false
    }

    if index == letters.count - 1 {
        return true
    }

    let position = row * columns + column
    visited.insert(position)

    for (rowOffset, columnOffset) in directions {
        let nextRow = row + rowOffset
        let nextColumn = column + columnOffset
        let nextPosition = nextRow * columns + nextColumn

        if isInside(nextRow, nextColumn),
           !visited.contains(nextPosition),
           search(nextRow, nextColumn, index + 1) {
            visited.remove(position)
            return true
        }
    }

    visited.remove(position)
    return false
}
```

Removing the position before returning restores the path state for other branches.

### How to Recognize This Pattern

Consider **Grid Backtracking with Path Visitation** when a sequence must be matched through adjacent cells and a cell cannot be reused within the same path.

## Explanation [_Second solution_]

Use the same depth-first traversal with a two-dimensional boolean matrix to record visited cells. Mark a cell before exploring its neighbors and unmark it after every unsuccessful path.

``` swift
visited[row][column] = true

for (rowOffset, columnOffset) in directions {
    let nextRow = row + rowOffset
    let nextColumn = column + columnOffset

    if isInside(nextRow, nextColumn),
       !visited[nextRow][nextColumn],
       search(nextRow, nextColumn, index + 1) {
        visited[row][column] = false
        return true
    }
}

visited[row][column] = false
```

This version is direct and avoids modifying the board, but it does not perform the frequency and search-direction pruning used by the optimal solution.

## Comparing solutions

| Aspect | Optimal solution: Pruned DFS | Second solution: Visited-Matrix DFS |
|:-------|:----------------------------:|:-----------------------------------:|
| Advantages | Rejects impossible words early and begins from the rarer end. | Uses a simple, explicit visited-cell structure. |
| Disadvantages | Requires frequency bookkeeping and may reverse the word. | Allocates one boolean for every board cell and explores more starts. |
| When to use it | When stronger pruning matters for a larger board. | When clarity is preferred and the board is small. |
| Interview recommendation | Preferred after explaining the basic DFS invariant and the pruning rules. | A clear baseline from which to derive the optimized search. |

## Complexity comparison

Let `m` be the number of rows, `n` the number of columns, `k` the length of `word`, and `Σ` the number of distinct characters tracked. After the first move, a path has at most three unvisited directions because it cannot immediately return to its previous cell.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Pruned DFS | `O(m × n × 3ᵏ)` | `O(k + Σ)` | Every cell may start a search whose paths branch up to three ways; the word copy, visited path, recursion stack, and frequency maps are stored. |
| Visited-Matrix DFS | `O(m × n × 3ᵏ)` | `O(m × n + k)` | It has the same worst-case search tree while storing a board-sized visited matrix and a recursion stack of depth at most `k`. |
