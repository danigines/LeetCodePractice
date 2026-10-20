class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result = [0]

        for bit in 0..<n {
            let leadingBit = 1 << bit

            for index in stride(from: result.count - 1, through: 0, by: -1) {
                result.append(leadingBit | result[index])
            }
        }

        return result
    }
}
