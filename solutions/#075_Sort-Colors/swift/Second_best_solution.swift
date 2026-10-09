class Solution {
    func sortColors(_ nums: inout [Int]) {
        var counts = Array(repeating: 0, count: 3)

        for number in nums {
            counts[number] += 1
        }

        var index = 0

        for color in 0...2 {
            for _ in 0..<counts[color] {
                nums[index] = color
                index += 1
            }
        }
    }
}
