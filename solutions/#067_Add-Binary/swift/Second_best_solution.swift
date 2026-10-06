class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let leftBits = Array(a.reversed())
        let rightBits = Array(b.reversed())
        let maximumLength = max(leftBits.count, rightBits.count)
        var carry = 0
        var reversedSum: [Character] = []
        reversedSum.reserveCapacity(maximumLength + 1)

        for index in 0..<maximumLength {
            let leftBit = index < leftBits.count && leftBits[index] == "1" ? 1 : 0
            let rightBit = index < rightBits.count && rightBits[index] == "1" ? 1 : 0
            let bitsXOR = leftBit ^ rightBit
            let sumBit = bitsXOR ^ carry

            carry = (leftBit & rightBit) | (carry & bitsXOR)
            reversedSum.append(sumBit == 0 ? "0" : "1")
        }

        if carry == 1 {
            reversedSum.append("1")
        }

        return String(reversedSum.reversed())
    }
}
