# Algorithms for Managers

This is my personal algorithms archives and it's where I store my algorithms research that aims to provide resources to better interview developers in my engineering management journey.

- [Data Structures](#data-structures)
  - [Arrays](#arrays)
  - [Strings](#strings)
  - [Linked Lists](#linked-lists)
  - [Stack and Queues](#stack-and-queues)
  - [Hash Tables](#hash-tables)
  - [Trees](#trees)
  - [Binary Search Trees](#binary-search-trees)
  - [Tries](#tries)
  - [Heaps](#heaps)
  - [Graphs](#graphs)
- [Algorithms](#algorithms)
  - [Searching](#searching)
    - [Linear Search](#linear-search)
    - [Binary Search](#binary-search)
    - [Other Search Algorithms](#other-search-algorithms)
  - [Sorting](#sorting)
    - [Introduction](#introduction)
    - [Bubble and Selection Sort](#bubble-and-selection-sort)
    - [Insertion Sort](#insertion-sort)
    - [Quick Sort](#quick-sort)
    - [Merge Sort](#merge-sort)
    - [Heap Sort](#heap-sort)
    - [Non-Comparison Sorting](#non-comparison-sorting)
    - [Last Word on Sorting](#last-word-on-sorting)
  - [Recursion](#recursion)
  - [Dynamic Programming](#dynamic-programming)
  - [Backtracking](#backtracking)
  - [Pathfinding](#pathfinding)
  - [Bit Manipulation](#bit-manipulation)
  - [Randomized Algorithms](#randomized-algorithms)
  - [Advanced Algorithms](#advanced-algorithms)

# Data Structures

## Arrays

Arrays are without a doubt the most fundamental data structure in computer science. Under the hood, an array is represented as a fixed-size, contiguous block of memory with `O(1)` time to store and access an element. Because of this efficiency, many other data structures frequently use arrays for their implementation, such as strings, stacks, queues, and hash tables.

You can picture an array as a bounded row of labeled containers, starting at 0, where you can quickly put items in, take them out, or look up a value from an index (or label).

Arrays do have a few limitations. Looking up an element up by value typically requires an entire traversal of the array, unless it is sorted in some way. Deleting an element from an array means that all subsequent elements have to be shifted left by one, leading to an `O(n)` time operation. If possible, it is better to overwrite the value. Similarly, inserting an element early in the array requires the rest of the elements to be shifted right, so this should be done sparingly.

Finally, arrays have a fixed bound, which means that they may not be suitable for applications where the size of the collection of elements is not known ahead of time. In an interview setting, you should be careful of off-by-one errors that lead to trying to access an element outside the range of the array.

Python does not have native support for arrays; typically, you'll use the `list` data structure, which dynamically resizes under the hood. What this means is that you, the developer, it seems like the list is unbounded. In reality, as the list grows, the data structure may allocate a larger (typically twice the current size) array, copy of its elements to the larger one, and then use that as the underlying array.

### Code Examples

- [Arrays](#arrays)
  - [Get products of all other elements](data-structures/arrays/README.md)
  - [Locate smallest window to be sorted](data-structures/arrays/README.md)
  - [Calculate maximum subarray sum](data-structures/arrays/README.md)
  - [Find number of smaller elements to the right](data-structures/arrays/README.md)

## Strings

Strings are unavoidable part of programming. Every word in this sentence can be considered a string!

Behind the scenes, the contents of a string are typically sorted in a read-only sequential array in memory, meaning that strings are immutable. In other words, you can reassign a string variable to a new value, but you cannot change a particular character in the underlying array.

The most common operations performed on strings are indexing to get a particular character or substring, joining two strings together by concatenation, and splitting by a delimiter.

Common cases of string questions:

- string rotations
- string reversals
- prefixes
- suffixes
- sorting

### Code Examples

- [Strings](#strings)
  - [Find anagram indices](data-structures/strings/README.md)
  - [Generate palindrome pairs](data-structures/strings/README.md)
  - [Print zigzap form](data-structures/strings/README.md)
  - [Determine smallest rotated string](data-structures/strings/README.md)

## Linked Lists

One way you can think of a linked list is a music playlist, where each item contains the song to be played and a `next song` button. In this abstract playlist, you cannot play any song you want; to play a given song you must play through all the songs before it first.

There are two main kinds of linked lists. Singly linked lists only contain a pointer to the next node, typically called next, and are implemented as follows:

```python
class Node:
  def __init___(self, data, next=None):
    self.data = data
    self.next = next
```

Linked lists are a recursive data structure: the type of next is another linked list node. Because of this, linked lists have no fixed size like arrays do: a new node can be initialized and appended to a linked list on the fly.

Doubly linked lists, meanwhile, have pointers to the previous and next nodes. They take up more space, but allow you to traverse backwards. The implementation for a doubly linked list looks like this:

```python
class Node:
  def __init__(self, data, next=None, prev=None):
    self.data = data
    self.next = next
    self.prev = prev
```

Returning to the analogy above, a doubly linked list would mean that each song has both a `previous song` and `next song` button.

Common operations on linked lists include searching, appending, prepending, and removing nodes.

## Stack and Queues

When you find yourself needing to frequently add and remove items from a list, stacks and queues are two data structures that you should consider.

To understand how a stack works, imagine a literal stack of cafeteria trays. Adding a new one to the top, and removing the top one can be done quickly, whereas it is difficult (read: not allowed) to change trays from the middle. This property is known by the shorthand `last in, first out`, or `LIFO`.

The tradicional names for these operations, as well as a method for checking the value of the top `tray`, are given in the following implementation, in which all methods are `O(1)`:

```python
class Stack:
  def __init__(self):
    self.stack = []

  def push(self, x):
    # Add an item to the stack.
    self.stack.append(x)

  def pop(self):
    # Remove and return the top element.
    return self.stack.pop()

  def peek(self):
    return self.stack[-1]
```

Note that a pop operation on an empty stack will result in an exception, unless there is proper error handling.

In the above implementation we have used a Python list as the underlying data structure, meaning the size of the stack will dynamically resize as necessary. Alternatively we could have used a linked list, so that new elements would be added to, and removed from, the tail of the existing chain.

A queue, on the other hand, can be thought of as a group of people standing in line, perhaps waiting to buy a book. Each person enters the line from the back, and leaves in exactly the order that they entered it, a property known as `first in, first out`, or `FIFO`.

Queues are commonly implemented as linked lists, where we enqueue and item by adding a tail node and dequeue an item by removing the head node and moving our head pointer forward.

In a double-ended queue, one can efficiently append and remove items to either side of the list.

```python
from collection import deque

queue = deque()

queue.append(4)
queue.append(5)
queue.appendleft(6)

print(queue)        # deque([6, 4, 5])

queue.popleft()     # 6
queue.pop()         # 5

print(queue)        # deque([4])
```

The `append` and `popleft` operations above are more traditionally called enqueue and dequeue, so in the following questions we will frequently use the latter terminology. Along with pop and `appendleft`, these operations run in O(1) time.

When the most recent item examined is the most important, a stack is frequently a good choice. For this reason stacks often feature in depth-first search, backtracking, and syntax parsing applications.

When the order of the items you are dealing with needs to be preserved, on the other hand, a queue is preferable. Queues can be found, for example, in breadth-first search, buffers, and scheduling applications.

## Hash Tables

A hash table is a crucial tool to keep in your data structure arsenal. Simply put, hash tables associate keys with values using a hash function, allowing for O(1) lookup, insert, and delete times.

You may be wondering, what's the catch? For one, not everything can be hashed. It is necessary that keys be immutable, so for example Python lists cannot be used as keys. Additionally, under the hood there may be a lot of work needed to implement a rigorous hash function.

```python
d = {}

d['key'] = 'value'
print(d['key']) # 'value'

del d['key']
print(d['key']) # KeyError: 'key'

if 'key' in d:
  print(d['key'])
else:
  print("key doesn't exist")
```

Note from above that if a key does not exist in a dictionary, simply trying to get the value will cause a `KeyError`.

The last few lines show one way of getting around this. In the solutions that follow, we will instead use the `defaultdict` library, which allows you pass in a callable parameter when declaring a dictionary to set the default value for each key.

A common motivating example for using hash tables is the two-sum problem, stated as follows:

Given a list of numbers a number `k`, return whether any two numbers from the list add up to k. For example, given `[10, 15, 3, 7]` and `k = 17`, we should return `10 + 7 = 17`.

Instead of a brute force solution which checks all pairs of integers to search for this total, we can use the following strategy. For each value we come across, we store it in a hash table with the `True`. We then check if the `k - value` exists in the table, and if so we can return `True`.

```python
def two_sum(lst, k):
  seen = {}
  for num in lst:
    if k - num in seen:
      return True
    seen[num] = True
  return false
```

This implementation cuts our time complexity down from `O(n2)` to `O(n)`, since each lookup is `O(1)`.

As the problem above demonstrates, if an interviewer asks you to make a solution more efficient, a dictionary  should be the first tool you look for.

## Trees

A tree is a recursive data structure consisting of a root node (typically shown at the top) with zero or more `child` nodes, where each child node acts as the root of a new tree.

For example, below is a binary tree rooted at 7. Binary here means simply that each node is only allowed to have up to two `leaf` nodes.

<pre>
  5 - -1
 /
7 - 10 - 4
     \
      40
</pre>

Note that we make no restriction at the moment as to the values of the tree.

Trees are directed and acyclic: the connections between parents and children always flow downward, so that it is impossible to form a loop. Further, in contrast to a typical family tree, two parents can never have the same child.

Common operations in tree involve:

- inserting, searching for, and deleting a particular node
- finding subtrees, or a subset of nodes that form their own tree
- determining the distance or relationship between two nodes

Typically to answer these questions you will need to perform a recursive tree traversal, which comes in three flavors:

- in-order: Traverse left node, then current node, then right
- pre-order: Traverse current node, then left node, then right
- post-order: Traverse left node, then right node, then current

For the tree above, for example, the three traversals would generate the following orders, respectively:

- [4, 10, 40, 7, -1, 5]
- [7, 10, 4, 40, 5, -1]
- [4, 40, 10, -1, 5, 7]

Other terminology to watch in trees:

- A node A is called an `ancestor` of a node B if it can be found on the path from the root to B.
- The height or depth of a tree is the length of the longest path from the root to any leaf.
- A full binary tree is a binary tree in which every non-leaf node has exactly two children.
- A complete binary tree is one in which all levels except for the bottom one are full, and all nodes on the bottom level are filled in left to right.

To implement a tree, we begin by defining a Node class and then using it to build `Tree` class:

```python
class Node:
  def __init__(self, data, left=None, right=None):
    self.data = data
    self.left = left
    self.right = right
```

The implementation of a given tree will often depend on the tree's application, and the particular traversal algorithm chosen.

Trees can represent a wide variety of objects: animal classification schemas, an HTML document object model, moves in a chess game, or a Linux file system are a few. In general when you are faced with hierarchical data, trees are a great data structure to choose.

## Binary Search Trees

A binary search tree, or BST, is a binary tree search whose node values are guaranteed to stay in sorted order; that is, an in-order traversal of its nodes will create a sorted list. For example, here is a BST of integers rooted at 7:

<pre>
    6
   /
  5 - -1
 /
7 - 10 - 25
</pre>

Similar to how a sorted array offers more efficient search times over unsorted arrays, BSTs provide several improvements over standard binary trees.

In particular, insert, find, and delete operations all run in O(h) time, where h is the height of the tree. If an efficient implementation is used to maintain the height of the tree around O(log n), where n is the number of nodes, then these operations will be all be logarithmic in n.

```python
class Node:
  def __init__(self, data, left=None, right=None):
    self.data = data
    self.left = left
    self.right = right

class BST:
  def __init__(self):
    self.root = None

  def insert(self, x):
    if not self.root:
      self.root = Node(x)
    else:
      self._insert(x, self.root)

  def _insert(self, x, root):
    if x < root.data:
      if not root.left:
        root.left = Node(x)
      else:
        self.insert(x, root.left)
    else:
      if not root.right:
        root.right = Node(x)
      else:
        self.insert(x, root.right)

  def find(self, x):
    if not self.root:
      return False
    else:
      return self._find(x, self.root)

  def _find(self, x, root):
    if not root:
      return False
    elif x == root.data:
      return True
    elif x < root.data:
      return self._find(x, root.left)
    else:
      return self._find(x, root.right)
```

Note that, as is common in recursive implementation, we use a helper function to properly define our insert and find methods.

The most common questions on binary search trees will ask you to search for elements, add and remove elements, and determine whether a tree is indeed a BST.

- [Strings](#strings)
  - [In-order](data-structures/binary_tree/README.md)
  - [Post-order](data-structures/binary_tree/README.md)
  - [Pre-order](data-structures/binary_tree/README.md)

## Tries

A trie is a kind of tree whose nodes typically represent string, where every descendant of a node shares a common prefix. For this reason tries are often referred to as prefix trees.

<pre>
  d - o - g
 /
  - c - a - t
 \   \
  \   o - a - t
   \
    b - e - a - r
</pre>

Following all paths from the root to each leaf spells out all the words that this trie contains, in this case "bear", "cat, "coast", and "dog".
There are two main methods used with tries:

- insert(word): add a word to the trie
- find(word): check if a word or prefix exists in the trie

Each one of these methods will run O(k), where k is the length of the word.

Tries can be implemented in several ways, but in an interview setting the simplest way is to use a nested dictionary, where each key maps to a dictionary whose keys are successive letters in a given word.

Here is a basic implementation of a trie in Python:

```python
ENDS_HERE = '#'

class Trie:
  def __init__(self):
    self._trie = {}

  def insert(self, text):
    trie = self._trie
    for char in text:
      if char not in trie:
        trie[char] = {}
      trie = trie[char]
    trie[ENDS_HERE] = True

  def find(self, prefix):
    trie = self._trie
    for char in prefix:
      if char in trie:
        trie = trie[char]
      else:
        return None
    return trie
```

## Heaps

## Graphs

# Algorithms

## Searching

### Linear Search

Linear search is the simplest algorithm used to search sequentially in a collection. It traverses the given collection linearly and compare each element with value being searched until value is found and or we hit the end of collection.

Only thing required is a logic to traverse given collection linearly. Some data structures like array, linked list, queue, stack, etc are sequential in the way they arrange data within themselves. Traversing such data structures linearly is natural and easy. For example, an array can be traversed linearly from either left-to-right or right-to-left, the sequence is deterministic and very intuitive. But if collection is a Binary tree, we can traverse the nodes sequentially in multiple ways, in-order, pre-order, post-order, level-order, reverse-level-order, etc.

In this section, I'm reviewing different collection where we apply linear search algorithms.

- [Linear Search](algorithms/searching/linear-search/README.md)
  - [Linear search in an Array](algorithms/searching/linear-search/README.md#linear-search-in-an-array)
  - [Linear search in a linked list](algorithms/searching/linear-search/README.md#linear-search-in-a-linked-list)
  - [Linear search in a binary tree](algorithms/searching/linear-search/README.md#linear-search-in-a-binary-tree)
  - [Linear search in a graph](algorithms/searching/linear-search/README.md#linear-search-in-a-graph)
  - [Naive search in a string](algorithms/searching/linear-search/README.md#naive-search-in-a-string)

### Binary Search

### Other Search Algorithms

## Sorting

### Introduction

### Bubble and Selection Sort

### Insertion Sort

### Quick Sort

### Merge Sort

### Heap Sort

### Non-Comparison Sorting

### Last Word on Sorting

## Recursion

## Dynamic Programming

## Backtracking

## Pathfinding

## Bit Manipulation

## Randomized Algorithms

## Advanced Algorithms
