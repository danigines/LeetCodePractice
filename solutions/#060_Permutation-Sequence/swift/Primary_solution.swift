class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var factorial = Array(repeating: 1, count: n + 1)

        if n > 1 {
            for value in 2...n {
                factorial[value] = factorial[value - 1] * value
            }
        }

        var numbers = Array(1...n)
        var rank = k - 1
        var result = ""

        for remaining in stride(from: n, through: 1, by: -1) {
            let blockSize = factorial[remaining - 1]
            let index = rank / blockSize
            rank %= blockSize
            result += String(numbers.remove(at: index))
        }

        return result
    }
}
