class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let space = Character(" ").asciiValue!
        var length = 0

        for byte in s.utf8.reversed() {
            if byte == space {
                if length > 0 { break }
            } else {
                length += 1
            }
        }

        return length
    }
}
