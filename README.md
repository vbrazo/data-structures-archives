# Algorithms for Tech Interviews

This is my personal algorithms archives and it's where I store my algoritms research that aims to provide resources to better interview developers in my engineering management journey.

- [Data Structures](#data-structures)
  - [Arrays](#arrays)
    - [Code Examples](#code-examples)
      - [Get products of all other elements](#get-products-of-all-other-elements)
      - [Locate smallest window to be sorted](#locate-smallest-window-to-be-sorted)
      - [Calculate maximum subarray sum](#calculate-maximum-subarray-sum)
      - [Find number of smaller elements to the right](#find-number-of-smaller-elements-to-the-right)
  - [Strings](#strings)
    - [Strings Code Examples](#strings-code-examples)
      - [Find anagram indices](#find-anagram-indices)
      - [Generate palindrome pairs](#generate-palindrome-pairs)
      - [Print zigzap form](#print-zigzap-form)
      - [Determine smallest rotated string](#determine-smallest-rotated-string)
  - [Linked Lists](#linked-lists)
  - [Stack and Queues](#stack-and-queues)
  - [Hash Tables](#hash-tables)
  - [Trees](#trees)
  - [Binary Search](#binary-search)
  - [Tries](#tries)
  - [Heaps](#heaps)
  - [Graphs](#graphs)
  - [Advanced Data Structures](#advanced-data-structures)
- [Algorithms](#algorithms)
  - [Recursion](#recursion)
  - [Dynamic Programming](#dynamic-programming)
  - [Backtracking](#backtracking)
  - [Sorting and Searching](#sorting-and-searching)
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

#### Get products of all other elements

Given an array of integers, return a new array such that each element at index `i` of the new array is the product of all the numbers in the original array except the one at `i`.

---

#### Locate smallest window to be sorted

Given an array of integers that are out of order, determine the bounds of the smallest window that must be sorted in order for the entire array to be sorted. For example, given `[3, 7, 5, 6, 9]`, you should return `(1, 3)`.

---

#### Calculate maximum subarray sum

Given an array of numbers, find the maximum sum of any contiguous subarray of the array. For example, given the array `[34, -50, 42, 14, -5, 86]`, the maximum sum would be `137`, since we would take elements 42, 14, -5, and 86. Given the array `[-5, -1, -8, -9]`, the maximum sum would be `0`, since we would choose not to take any elements.

Do this in `O(n)` time.

---

#### Find number of smaller elements to the right

Given an array of integers, return a new array where each element in the new array is the number of smaller elements to the right of that element in the original input array.

For example, given the array `[3, 4, 9, 6, 1]`, return `[1, 1, 2, 1, 0]`, since:

- There is 1 smaller element to the right of 3
- There is 1 smaller element to the right of 4
- There is are smaller elements to the right of 9
- There is 1 smaller element to the right of 6
- There are no smaller elements to the right of 1

## Strings

Strings are unavoidable part of programming. Every word in this sentence can be considered a string!

Behind the scenes, the contents of a string are typically sotred in a read-only sequential array in memory, meaning that strings are immutable. In other words, you can reassign a string variable to a new value, but you cannot change a particular character in the underlying array.

The most common operations perfomed on strings are indexing to get a particular character or substring, joining two strings together by concatenation, and splitting by a delimiter.

Common cases of string questions:

- string rotations
- string reversals
- prefixes
- suffixes
- sorting

## Strings Code Examples

### Find anagram indices

Given a word `w`, and a string `s`, find all indices in `s` which are the starting locations of anagrams of `w`.

For example, given `w` is `ab` and `s` is `abxaba`, return `[0, 3, 4]`.

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

You are given a string of length n and an integer `k`. The stirng can be manipulated by taking one of the first `k` letters and moving it to the end of the string.

Write a program to determine the lexicographically smallest string that can be created after an unlimitted number of moves.

For example, suppose we are given the string daily and `k = 1`. The best we can create in this case is `ailyd`.

## Linked Lists

## Stack and Queues

## Hash Tables

## Trees

## Binary Search

## Tries

## Heaps

## Graphs

## Advanced Data Structures

# Algorithms

## Recursion

## Dynamic Programming

## Backtracking

## Sorting and Searching

## Pathfinding

## Bit Manipulation

## Randomized Algorithms

## Advanced Algorithms
