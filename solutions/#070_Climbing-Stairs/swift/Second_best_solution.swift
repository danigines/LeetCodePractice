class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo = Array(repeating: 0, count: n + 1)

        func countWays(_ step: Int) -> Int {
            if step <= 1 {
                return 1
            }

            if memo[step] != 0 {
                return memo[step]
            }

            memo[step] = countWays(step - 1) + countWays(step - 2)
            return memo[step]
        }

        return countWays(n)
    }
}
