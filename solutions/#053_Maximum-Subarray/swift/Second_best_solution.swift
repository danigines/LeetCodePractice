class Solution {
    private struct SubarrayStatus {
        let total: Int
        let prefix: Int
        let suffix: Int
        let best: Int
    }

    func maxSubArray(_ nums: [Int]) -> Int {
        func merge(
            _ left: SubarrayStatus,
            _ right: SubarrayStatus
        ) -> SubarrayStatus {
            SubarrayStatus(
                total: left.total + right.total,
                prefix: max(left.prefix, left.total + right.prefix),
                suffix: max(right.suffix, right.total + left.suffix),
                best: max(
                    max(left.best, right.best),
                    left.suffix + right.prefix
                )
            )
        }

        func solve(_ left: Int, _ right: Int) -> SubarrayStatus {
            if left == right {
                let value = nums[left]
                return SubarrayStatus(
                    total: value,
                    prefix: value,
                    suffix: value,
                    best: value
                )
            }

            let middle = left + (right - left) / 2
            return merge(solve(left, middle), solve(middle + 1, right))
        }

        return solve(0, nums.count - 1).best
    }
}
