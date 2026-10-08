class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var source = Array(word1)
        var target = Array(word2)

        if target.count > source.count {
            swap(&source, &target)
        }

        var previous = Array(0...target.count)
        var current = Array(repeating: 0, count: target.count + 1)

        for sourceIndex in source.indices {
            current[0] = sourceIndex + 1

            for targetIndex in target.indices {
                let column = targetIndex + 1

                if source[sourceIndex] == target[targetIndex] {
                    current[column] = previous[column - 1]
                } else {
                    current[column] = 1 + min(
                        previous[column],
                        current[column - 1],
                        previous[column - 1]
                    )
                }
            }

            swap(&previous, &current)
        }

        return previous[target.count]
    }
}
