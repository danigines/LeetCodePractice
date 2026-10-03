class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var used = Array(repeating: false, count: n + 1)
        var permutation = [Int]()
        var completed = 0
        var result = ""

        func search() -> Bool {
            if permutation.count == n {
                completed += 1

                if completed == k {
                    result = permutation.map(String.init).joined()
                    return true
                }

                return false
            }

            for number in 1...n where !used[number] {
                used[number] = true
                permutation.append(number)

                if search() { return true }

                permutation.removeLast()
                used[number] = false
            }

            return false
        }

        _ = search()
        return result
    }
}
