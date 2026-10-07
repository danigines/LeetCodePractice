class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }

        var oneStepBefore = 1
        var twoStepsBefore = 1

        for _ in 2...n {
            let current = oneStepBefore + twoStepsBefore
            twoStepsBefore = oneStepBefore
            oneStepBefore = current
        }

        return oneStepBefore
    }
}
