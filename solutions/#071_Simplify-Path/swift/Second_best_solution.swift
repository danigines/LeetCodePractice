class Solution {
    func simplifyPath(_ path: String) -> String {
        var directories: [String] = []
        var component = ""

        func processComponent() {
            if component == ".." {
                if !directories.isEmpty {
                    directories.removeLast()
                }
            } else if !component.isEmpty && component != "." {
                directories.append(component)
            }

            component.removeAll(keepingCapacity: true)
        }

        for character in path {
            if character == "/" {
                processComponent()
            } else {
                component.append(character)
            }
        }

        processComponent()
        return "/" + directories.joined(separator: "/")
    }
}
