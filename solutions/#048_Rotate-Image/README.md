# 48. Rotate Image

[![medium](../../src/images/badges/difficulty/medium.svg)](../../src/md/difficulty/medium.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![math](../../src/images/badges/topics/math.svg)](../../src/md/topics/Math.md)
[![matrix](../../src/images/badges/topics/matrix.svg)](../../src/md/topics/Matrix.md)

Given an `n × n` matrix representing an image, rotate it 90 degrees clockwise [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm), modifying the input matrix directly without allocating another 2D matrix.

### Example 1
> ![Three by three matrix rotated clockwise](https://assets.leetcode.com/uploads/2020/08/28/mat1.jpg)
>
> **Input**: matrix = [[1,2,3],[4,5,6],[7,8,9]]
>
> **Output**: [[7,4,1],[8,5,2],[9,6,3]]

### Example 2
> ![Four by four matrix rotated clockwise](https://assets.leetcode.com/uploads/2020/08/28/mat2.jpg)
>
> **Input**: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
>
> **Output**: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

## Constraints
- `n == matrix.length == matrix[i].length`
- `1 <= n <= 20`
- `-1000 <= matrix[i][j] <= 1000`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/rotate-image/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/48/
