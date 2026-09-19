class Solution {
    func trap(_ height: [Int]) -> Int {
        var decreasingStack: [Int] = []
        var trappedWater = 0

        for index in height.indices {
            while let bottom = decreasingStack.last, height[index] > height[bottom] {
                decreasingStack.removeLast()
                guard let leftBoundary = decreasingStack.last else { break }

                let width = index - leftBoundary - 1
                let boundedHeight = min(height[leftBoundary], height[index]) - height[bottom]
                trappedWater += width * boundedHeight
            }

            decreasingStack.append(index)
        }

        return trappedWater
    }
}
