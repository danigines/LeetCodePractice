class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        for number in nums {
            if number == target {
                return true
            }
        }

        return false
    }
}
