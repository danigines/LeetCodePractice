## Explanation [_Optimal solution_]

Scan the string once while tracking whether a digit, decimal point, and exponent have appeared. A second flag records whether the exponent has at least one digit after it.

Each symbol is valid only in a specific context:

- A digit is always accepted.
- A sign is accepted only at the beginning or immediately after `e` or `E`.
- A dot is accepted only before the exponent and only once.
- An exponent is accepted only once and only after at least one digit.
- Any other character makes the string invalid.

``` swift
for character in s {
    if character.isNumber {
        hasDigit = true
        if hasExponent {
            hasDigitAfterExponent = true
        }
    } else if character == "+" || character == "-" {
        if position != 0 && previousCharacter != "e" && previousCharacter != "E" {
            return false
        }
    } else if character == "." {
        if hasDot || hasExponent {
            return false
        }
        hasDot = true
    } else if character == "e" || character == "E" {
        if hasExponent || !hasDigit {
            return false
        }
        hasExponent = true
        hasDigitAfterExponent = false
    } else {
        return false
    }
}
```

The final result requires a digit in the mantissa and, when an exponent exists, a digit after it.

### How to Recognize This Pattern

Consider a **Single-Pass State Validator** when input validity depends on whether specific token types have appeared and where the current token is allowed.

## Explanation [_Second solution_]

Parse the string according to the numeric grammar instead of validating individual characters with flags:

``` text
number   = sign? (digits "." digits? | "." digits | digits) exponent?
exponent = ("e" | "E") sign? digits
```

First consume an optional sign, then the digits on each side of an optional decimal point. At least one of those two digit groups must exist. If an exponent follows, consume its optional sign and require at least one exponent digit. The number is valid only if the parser reaches the end of the string.

``` swift
consumeSign()

let hasIntegerDigits = consumeDigits()
var hasFractionDigits = false

if index < s.endIndex && s[index] == "." {
    index = s.index(after: index)
    hasFractionDigits = consumeDigits()
}

guard hasIntegerDigits || hasFractionDigits else {
    return false
}
```

## Comparing solutions

| Aspect | Optimal solution: State Validator | Second solution: Grammar Parser |
|:-------|:---------------------------------:|:-------------------------------:|
| Advantages | Performs one compact scan and rejects invalid symbols immediately. | Closely matches the formal definition of a valid number. |
| Disadvantages | Interactions between flags require careful reasoning. | Uses several parsing steps and helper functions. |
| When to use it | When a small set of state flags fully describes validity. | When the input has a clear grammar that may need extension. |
| Interview recommendation | Preferred for a concise linear solution after listing every transition rule. | Useful when explaining the grammar is clearer than explaining state flags. |

## Complexity comparison

Let `n` be the number of characters in `s`.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| State Validator | `O(n)` | `O(1)` | Every character is examined once, and only a fixed set of flags is stored. |
| Grammar Parser | `O(n)` | `O(1)` | The parser advances through each character at most once and stores only indices and boolean values. |
