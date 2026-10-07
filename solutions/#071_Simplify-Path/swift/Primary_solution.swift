class Solution {
    func simplifyPath(_ path: String) -> String {
        var directories: [Substring] = []

        for component in path.split(separator: "/") {
            if component == "." {
                continue
            }

            if component == ".." {
                if !directories.isEmpty {
                    directories.removeLast()
                }
            } else {
                directories.append(component)
            }
        }

        return "/" + directories.joined(separator: "/")
    }
}
