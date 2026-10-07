# 71. Simplify Path

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![stack](../../src/images/badges/topics/stack.svg)](../../src/md/topics/Stack.md)

Given an absolute path for a Unix-style file system, return its simplified canonical path.

The following rules apply:
- `.` represents the current directory.
- `..` moves to the parent directory when one exists.
- Multiple consecutive slashes are treated as one slash.
- Any other sequence of periods, such as `...`, is a valid directory or file name.

The canonical path starts with one slash, uses exactly one slash between directories, and has no trailing slash unless it is the root path.

### Example 1
> **Input**: path = "/home/"
>
> **Output**: "/home"
>
> **Explanation**: The trailing slash is removed.

### Example 2
> **Input**: path = "/home//foo/"
>
> **Output**: "/home/foo"
>
> **Explanation**: Consecutive slashes are replaced by a single slash.

### Example 3
> **Input**: path = "/home/user/Documents/../Pictures"
>
> **Output**: "/home/user/Pictures"
>
> **Explanation**: `..` removes the previous directory, `Documents`.

### Example 4
> **Input**: path = "/../"
>
> **Output**: "/"
>
> **Explanation**: It is not possible to move above the root directory.

### Example 5
> **Input**: path = "/.../a/../b/c/../d/./"
>
> **Output**: "/.../b/d"
>
> **Explanation**: `...` is a valid directory name, while `..` and `.` keep their special meanings.

## Constraints
- `1 <= path.count <= 3000`
- `path` contains English letters, digits, periods (`.`), slashes (`/`), or underscores (`_`).
- `path` is a valid absolute Unix path.

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/simplify-path/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/71/
