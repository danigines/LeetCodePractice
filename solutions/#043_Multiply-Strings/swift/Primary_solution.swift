class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }

        let first = Array(num1.utf8)
        let second = Array(num2.utf8)
        var product = Array(repeating: 0, count: first.count + second.count)

        for i in first.indices {
            let firstDigit = Int(first[i] - 48)
            for j in second.indices {
                let secondDigit = Int(second[j] - 48)
                product[i + j + 1] += firstDigit * secondDigit
            }
        }

        for index in stride(from: product.count - 1, through: 1, by: -1) {
            product[index - 1] += product[index] / 10
            product[index] %= 10
        }

        let start = product[0] == 0 ? 1 : 0
        let digits = product[start...].map { UInt8($0 + 48) }
        return String(decoding: digits, as: UTF8.self)
    }
}
