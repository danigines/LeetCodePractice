## Explanation [_Optimal solution_]

Anagrams contain every letter the same number of times. Count the 26 lowercase letters in each word and serialize those counts into a dictionary key:

``` text
"eat" → [1,0,0,0,1,...,1,...]
"tea" → [1,0,0,0,1,...,1,...]
"tan" → [1,0,0,0,0,...,1,...,1,...]
```

Words with identical signatures enter the same group:

``` swift
let signature = frequency.map(String.init).joined(separator: "#")
groups[signature, default: []].append(word)
```

The separators keep neighboring counts unambiguous: for example, counts `1` and `11` cannot be confused with `11` and `1`. The constraints guarantee lowercase English letters, so each UTF-8 byte maps directly to an index from `0` through `25`. The signature has a constant number of fields, and no character sorting is required.

### How to Recognize This Pattern

Consider **Grouping by a Canonical Signature** when different inputs are equivalent under some transformation. Build a key that is identical exactly when two inputs belong to the same group, then collect them in a hash table.

## Explanation [_Second solution_]

Sort the characters of each word and use the resulting string as its signature. All anagrams become the same sorted sequence:

``` text
"eat" → "aet"
"tea" → "aet"
"ate" → "aet"
```

This approach is concise and works naturally for any comparable character set, but sorting every word adds a logarithmic factor.

## Comparing solutions

| Aspect | Optimal solution: Letter Frequencies | Second solution: Sorted String |
|:-------|:------------------------------------:|:------------------------------:|
| Advantages | Builds each signature in linear time with a fixed 26-entry key. | Very direct and easy to generalize. |
| Disadvantages | Relies on the lowercase-English-letter constraint. | Sorts all characters of every word. |
| When to use it | When the alphabet is small and fixed. | When simplicity or a broader character set matters more. |
| Interview recommendation | Preferred after confirming the alphabet constraint. | A strong baseline that is quick to explain. |

## Complexity comparison

Let `n` be the number of strings and `k` the maximum length of a string. Expected dictionary operations are `O(1)` on average.

| Solution | Time | Space | Reason |
|:---------|:----:|:-----:|:-------|
| Letter Frequencies | `O(n × k)` expected | `O(n + k)` auxiliary | Every character is counted once. There are at most `n` fixed-size signatures and group entries, while processing a word may expose up to `k` UTF-8 bytes. |
| Sorted String | `O(n × k log k)` expected | `O(n × k)` auxiliary | Sorting each word costs `O(k log k)`, and up to `n` signatures of length `k` are stored in the dictionary. |

The returned groups store all `n` input strings and are excluded from the auxiliary-space comparison.
