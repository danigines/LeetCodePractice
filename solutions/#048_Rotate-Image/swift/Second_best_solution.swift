class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let size = matrix.count

        for layer in 0..<(size / 2) {
            let last = size - 1 - layer

            for column in layer..<last {
                let offset = column - layer
                let top = matrix[layer][column]

                matrix[layer][column] = matrix[last - offset][layer]
                matrix[last - offset][layer] = matrix[last][last - offset]
                matrix[last][last - offset] = matrix[column][last]
                matrix[column][last] = top
            }
        }
    }
}
