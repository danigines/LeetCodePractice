class Solution {
    func intToRoman(_ num: Int) -> String {
        // Each table contains every valid representation for one decimal position.
        let thousands = ["", "M", "MM", "MMM"]
        let hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

        // Extract each decimal digit and map it directly to its Roman representation.
        let thousandsPart = thousands[num / 1000]
        let hundredsPart = hundreds[(num % 1000) / 100]
        let tensPart = tens[(num % 100) / 10]
        let onesPart = ones[num % 10]

        return thousandsPart + hundredsPart + tensPart + onesPart
    }
}
