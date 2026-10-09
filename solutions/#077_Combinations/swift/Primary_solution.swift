class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combination: [Int] = []

        func backtrack(_ start: Int) {
            if combination.count == k {
                results.append(combination)
                return
            }

            let remainingNeeded = k - combination.count
            let maximumCandidate = n - remainingNeeded + 1

            guard start <= maximumCandidate else {
                return
            }

            for number in start...maximumCandidate {
                combination.append(number)
                backtrack(number + 1)
                combination.removeLast()
            }
        }

        backtrack(1)
        return results
    }
}
