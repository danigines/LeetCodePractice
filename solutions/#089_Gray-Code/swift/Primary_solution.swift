class Solution {
    func grayCode(_ n: Int) -> [Int] {
        let sequenceLength = 1 << n

        return (0..<sequenceLength).map { number in
            number ^ (number >> 1)
        }
    }
}
