class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var leftIndex = a.endIndex
        var rightIndex = b.endIndex
        var carry = 0
        var reversedSum: [Character] = []
        reversedSum.reserveCapacity(max(a.count, b.count) + 1)

        while leftIndex > a.startIndex || rightIndex > b.startIndex || carry > 0 {
            var total = carry

            if leftIndex > a.startIndex {
                leftIndex = a.index(before: leftIndex)
                total += a[leftIndex] == "1" ? 1 : 0
            }

            if rightIndex > b.startIndex {
                rightIndex = b.index(before: rightIndex)
                total += b[rightIndex] == "1" ? 1 : 0
            }

            reversedSum.append(total % 2 == 0 ? "0" : "1")
            carry = total / 2
        }

        return String(reversedSum.reversed())
    }
}
