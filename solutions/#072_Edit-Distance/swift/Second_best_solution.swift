class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let source = Array(word1)
        let target = Array(word2)
        var memo = Array(
            repeating: Array(repeating: -1, count: target.count),
            count: source.count
        )

        func distance(_ sourceIndex: Int, _ targetIndex: Int) -> Int {
            if sourceIndex == source.count {
                return target.count - targetIndex
            }

            if targetIndex == target.count {
                return source.count - sourceIndex
            }

            if memo[sourceIndex][targetIndex] != -1 {
                return memo[sourceIndex][targetIndex]
            }

            let result: Int

            if source[sourceIndex] == target[targetIndex] {
                result = distance(sourceIndex + 1, targetIndex + 1)
            } else {
                result = 1 + min(
                    distance(sourceIndex + 1, targetIndex),
                    distance(sourceIndex, targetIndex + 1),
                    distance(sourceIndex + 1, targetIndex + 1)
                )
            }

            memo[sourceIndex][targetIndex] = result
            return result
        }

        return distance(0, 0)
    }
}
