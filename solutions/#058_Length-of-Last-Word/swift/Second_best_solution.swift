class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var currentLength = 0
        var lastWordLength = 0

        for character in s {
            if character == " " {
                if currentLength > 0 {
                    lastWordLength = currentLength
                    currentLength = 0
                }
            } else {
                currentLength += 1
            }
        }

        return currentLength > 0 ? currentLength : lastWordLength
    }
}
