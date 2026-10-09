class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0
        var current = 0
        var high = nums.count - 1

        while current <= high {
            switch nums[current] {
            case 0:
                nums.swapAt(low, current)
                low += 1
                current += 1
            case 1:
                current += 1
            default:
                nums.swapAt(current, high)
                high -= 1
            }
        }
    }
}
