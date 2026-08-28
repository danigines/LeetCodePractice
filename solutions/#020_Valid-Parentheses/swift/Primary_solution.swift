class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        for character in s {
            switch character {
            // Store the closing bracket we expect to see later.
            case "(":
                stack.append(")")
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")

            // A closing bracket must match the most recently expected one.
            default:
                guard stack.popLast() == character else {
                    return false
                }
            }
        }

        // Any remaining bracket means an opening bracket was never closed.
        return stack.isEmpty
    }
}
