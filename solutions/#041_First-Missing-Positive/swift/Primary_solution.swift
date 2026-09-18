class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var values = nums
        let count = values.count

        for index in 0..<count {
            while values[index] > 0 && values[index] <= count {
                let target = values[index] - 1
                if values[target] == values[index] { break }
                values.swapAt(index, target)
            }
        }

        for index in 0..<count {
            if values[index] != index + 1 {
                return index + 1
            }
        }

        return count + 1
    }
}
