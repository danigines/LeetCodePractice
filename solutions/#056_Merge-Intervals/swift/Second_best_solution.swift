class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()
        var merged = [[Int]]()
        var currentStart = starts[0]

        for index in intervals.indices {
            let isLastInterval = index == intervals.count - 1

            if isLastInterval || starts[index + 1] > ends[index] {
                merged.append([currentStart, ends[index]])

                if !isLastInterval {
                    currentStart = starts[index + 1]
                }
            }
        }

        return merged
    }
}
