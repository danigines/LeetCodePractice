class Solution {
    func mySqrt(_ x: Int) -> Int {
        var root = 0

        while root + 1 <= x / (root + 1) {
            root += 1
        }

        return root
    }
}
