class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combination: [Int] = []

        func decide(_ number: Int) {
            if combination.count == k {
                results.append(combination)
                return
            }

            guard number <= n else {
                return
            }

            let remainingCandidates = n - number + 1

            guard combination.count + remainingCandidates >= k else {
                return
            }

            combination.append(number)
            decide(number + 1)
            combination.removeLast()

            decide(number + 1)
        }

        decide(1)
        return results
    }
}
