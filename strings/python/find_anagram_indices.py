# Brute force solution
#
# This would take O(w x s) time, where w is the length of the word
# and s is the length of the input string
from collections import Counter

def is_anagram(s1, s2):
    return Counter(s1) == Counter(s2)

def anagram_indices(word, s):
    result = []
    for i in range(len(s) - len(word) + 1):
        window = s[i:i + len(word)]
        if is_anagram(window, word):
            result.append(i)
    return result

print(anagram_indices("ab", "abxaba"))
