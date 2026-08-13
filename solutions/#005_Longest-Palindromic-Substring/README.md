# 5. Longest Palindromic Substring

![Medium](../../src/images/badges/difficulty/medium.svg)
![TwoPointers](../../src/images/badges/topics/two-pointers.svg)
![String](../../src/images/badges/topics/string.svg)
![DynamicProgramming](../../src/images/badges/topics/dynamic-programming.svg)
![DivideAndConquer](../../src/images/badges/topics/divide-and-conquer.svg)

Given a string `s`, return the longest palindromic substring in `s`.

> A palindrome is a sequence of characters that reads the same forward and backward.

### Example 1
> **Input**: s = "babad"
> 
> **Output**: "bab"
> 
> **Explanation**: "aba" is also a valid answer.

### Example 2
> **Input**: s = "cbbd"
> 
> **Output**: "bb"

### Constraints
- `1 <= s.length <= 1000`
- `s` consists only of digits and English letters.

<details>
<summary>💡 Hint 1</summary>
How can we reuse a previously computed palindrome to compute a larger palindrome?
</details>
<details>
<summary>💡 Hint 2</summary>
If “aba” is a palindrome, is “xabax” a palindrome? Similarly is “xabay” a palindrome?
</details>
<details>
<summary>💡 Hint 3</summary>
Complexity based hint:
If we use brute-force and check whether for every start and end position a substring is a palindrome we have O(n^2) start - end pairs and O(n) palindromic checks. Can we reduce the time for palindromic checks to O(1) by reusing some previous computation.
</details>

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/longest-palindromic-substring/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/5/
