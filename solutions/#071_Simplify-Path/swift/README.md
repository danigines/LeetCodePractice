## Explanation [_Optimal solution_]

Split the path at each slash. Empty components disappear automatically, which handles repeated and trailing slashes.

Use a stack to represent the directories in the current canonical path:

- Ignore `.` because it stays in the current directory.
- For `..`, remove the most recent directory if one exists.
- Push every other component, including names such as `...`.

``` swift
for component in path.split(separator: "/") {
    if component == "." {
        continue
    }

    if component == ".." {
        if !directories.isEmpty {
            directories.removeLast()
        }
    } else {
        directories.append(component)
    }
}
```

Finally, join the stack with one slash between components and prepend the root slash.

### How to Recognize This Pattern

Consider a **Stack for Hierarchical Navigation** when tokens can enter the current path, leave it unchanged, or undo the most recent valid level.

## Explanation [_Second solution_]

Scan the path one character at a time and build the current component manually. Whenever a slash is found, process the completed component with the same stack rules and clear the buffer.

``` swift
func processComponent() {
    if component == ".." {
        if !directories.isEmpty {
            directories.removeLast()
        }
    } else if !component.isEmpty && component != "." {
        directories.append(component)
    }

    component.removeAll(keepingCapacity: true)
}
```

Process once more after the loop so a final component without a trailing slash is not missed. This approach avoids relying on `split` and makes tokenization explicit.

## Comparing solutions

| Aspect | Optimal solution: Split + Stack | Second solution: Manual Scanner |
|:-------|:-------------------------------:|:-------------------------------:|
| Advantages | Concise and directly expresses the directory rules. | Gives full control over tokenization and avoids creating a collection of all split components. |
| Disadvantages | Relies on the behavior of `split` for empty components. | Requires explicit buffering and a final component flush. |
| When to use it | When standard string splitting is available and appropriate. | When parsing must be streamed or separator handling needs customization. |
| Interview recommendation | Preferred after explaining why the stack models parent-directory operations. | A useful alternative if asked to implement parsing manually. |

## Complexity comparison

Let `n` be the number of characters in `path`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Split + Stack | `O(n)` | `O(n)` | Every character belongs to at most one component, and the stack may retain all directory characters. |
| Manual Scanner | `O(n)` | `O(n)` | Every character is scanned once, while the component buffer and directory stack together may store a linear number of characters. |
