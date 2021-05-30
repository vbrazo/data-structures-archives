# Implement Trie (Prefix Tree)
#
# A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
#
# Implement the Trie class:
#
# Trie() Initializes the trie object.
# void insert(String word) Inserts the string word into the trie.
# boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
# boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
#
# Example 1:
#
# Input
# ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
# [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
# Output
# [null, null, true, false, true, null, true]
#
# Explanation
# Trie trie = new Trie();
# trie.insert("apple");
# trie.search("apple");   // return True
# trie.search("app");     // return False
# trie.startsWith("app"); // return True
# trie.insert("app");
# trie.search("app");     // return True

class Trie
  # Initialize your data structure here.
  def initialize
    @root = {}
    @end = '#'
  end

  # Complexity Analysis
  #
  # Time complexity: O(m), where m is the key length.
  # In each iteration of the algorithm, we either examine or create a node in
  # the trie till we reach the end of the key. This takes only mm operations.
  #
  # Space complexity: O(m).
  # In the worst case newly inserted key doesn't share a prefix with the the
  # keys already inserted in the trie. We have to add mm new nodes, which takes us O(m) space.

  # Inserts a word into the trie.
  #  :type word: String
  #  :rtype: Void
  def insert(word)
    node = @root

    0.upto(word.length - 1) do |i|
      char = word[i]
      node[char] = {} unless node[char]
      node = node[char]
    end

    node[@end] = true
  end

  # Complexity Analysis
  # 
  # Time complexity: O(m)
  # Space complexity: O(1)

  # Returns if the word is in the trie.
  #  :type word: String
  #  :rtype: Boolean
  def search(word)
    node = @root
    0.upto(word.length - 1) do |i|
      char = word[i]
      return false unless node[char]

      node = node[char]
    end
    node[@end] == true
  end

  # Returns if there is any word in the trie that starts with the given prefix.
  #  :type prefix: String
  #  :rtype: Boolean
  def starts_with(prefix)
    node = @root
    0.upto(prefix.length - 1) do |i|
      char = prefix[i]
      return false unless node[char]

      node = node[char]
    end
    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
