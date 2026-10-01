class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted {
            $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
        }
        var merged = [[Int]]()
        var currentStart = sortedIntervals[0][0]
        var currentEnd = sortedIntervals[0][1]

        for interval in sortedIntervals.dropFirst() {
            let start = interval[0]
            let end = interval[1]

            if start > currentEnd {
                merged.append([currentStart, currentEnd])
                currentStart = start
                currentEnd = end
            } else {
                currentEnd = max(currentEnd, end)
            }
        }

        merged.append([currentStart, currentEnd])
        return merged
    }
}
