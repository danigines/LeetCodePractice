class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        let sortedIntervals = (intervals + [newInterval]).sorted {
            $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
        }
        var merged = [[Int]]()

        for interval in sortedIntervals {
            guard !merged.isEmpty,
                  interval[0] <= merged[merged.count - 1][1] else {
                merged.append(interval)
                continue
            }

            merged[merged.count - 1][1] = max(
                merged[merged.count - 1][1],
                interval[1]
            )
        }

        return merged
    }
}
