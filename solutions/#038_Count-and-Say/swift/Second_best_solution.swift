class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }

        let previous = Array(countAndSay(n - 1))
        var next: [Character] = []
        var index = 0

        while index < previous.count {
            let digit = previous[index]
            var end = index + 1

            while end < previous.count && previous[end] == digit {
                end += 1
            }

            // Expand the count into digit characters before the run's value.
            next.append(contentsOf: String(end - index))
            next.append(digit)
            index = end
        }

        return String(next)
    }
}
