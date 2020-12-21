# Strings

- [Strings](#strings)
  - [Strings Code Examples](#strings-code-examples)
    - [Find anagram indices](#find-anagram-indices)
    - [Generate palindrome pairs](#generate-palindrome-pairs)
    - [Print zigzap form](#print-zigzap-form)
    - [Determine smallest rotated string](#determine-smallest-rotated-string)

### Find anagram indices

Given a word `w`, and a string `s`, find all indices in `s` which are the starting locations of anagrams of `w`.

For example, given `w` is `ab` and `s` is `abxaba`, return `[0, 3, 4]`.

- [Python](python/find_anagram_indices.py)

---

### Generate palindrome pairs

Given a list of words, find all pairs of unique indices such that the concatenation of the two words is a palindrome.

For example, given the list `["code", "edoc", "da", "d"]` return `[(0, 1), (1, 0), (2, 3)]`.

---

### Print zigzap form

Given a string and a number of lines k, print the string in zigzag form. In zigzag, characters are printed out diagonally from top left to bottom right until reaching the kth line, then back up to top right, and so on.

For example, given the sentence "thisiszigzap", you should print:

```
t     a     g
 h   s z   a
  i i   i z
   s     g
```

---

### Determine smallest rotated string

You are given a string of length n and an integer `k`. The string can be manipulated by taking one of the first `k` letters and moving it to the end of the string.

Write a program to determine the lexicographically smallest string that can be created after an unlimited number of moves.

For example, suppose we are given the string daily and `k = 1`. The best we can create in this case is `ailyd`.
