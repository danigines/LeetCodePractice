# 68. Text Justification

[![hard](../../src/images/badges/difficulty/hard.svg)](../../src/md/difficulty/hard.md)
[![array](../../src/images/badges/topics/array.svg)](../../src/md/topics/Array.md)
[![string](../../src/images/badges/topics/string.svg)](../../src/md/topics/String.md)
[![simulation](../../src/images/badges/topics/simulation.svg)](../../src/md/topics/Simulation.md)

Given an array of strings `words` and an integer `maxWidth`, format the text so every line contains exactly `maxWidth` characters and is fully justified.

Pack as many words as possible into each line. Distribute spaces between words as evenly as possible, assigning any remaining spaces to the leftmost gaps. The last line and every line containing a single word must be left-justified.

### Example 1
> **Input**: words = ["This","is","an","example","of","text","justification."], maxWidth = 16
>
> **Output**:
>
> ``` text
> [
> "This    is    an",
> "example  of text",
> "justification.  "
> ]
> ```

### Example 2
> **Input**: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
>
> **Output**:
>
> ``` text
> [
> "What   must   be",
> "acknowledgment  ",
> "shall be        "
> ]
> ```
>
> **Explanation**: The last line uses one space between its words and pads the remaining width on the right. The second line is also left-justified because it contains one word.

### Example 3
> **Input**: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
>
> **Output**:
>
> ``` text
> [
> "Science  is  what we",
> "understand      well",
> "enough to explain to",
> "a  computer.  Art is",
> "everything  else  we",
> "do                  "
> ]
> ```

## Constraints
- `1 <= words.count <= 300`
- `1 <= words[index].count <= 20`
- `words[index]` contains only English letters and symbols.
- `1 <= maxWidth <= 100`
- `words[index].count <= maxWidth`

---

Links:
* _LeetCode URL_: https://leetcode.com/problems/text-justification/description/
* _Wiki_: https://leetcode.doocs.org/en/lc/68/
