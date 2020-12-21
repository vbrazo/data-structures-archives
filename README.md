# Algorithms for Managers

This is my personal algorithms archives and it's where I store my algorithms research that aims to provide resources to better interview developers in my engineering management journey.

- [Data Structures](#data-structures)
  - [Arrays](#arrays)
  - [Strings](#strings)
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
  - [Get products of all other elements](arrays/README.md)
  - [Locate smallest window to be sorted](arrays/README.md)
  - [Calculate maximum subarray sum](arrays/README.md)
  - [Find number of smaller elements to the right](arrays/README.md)

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
  - [Find anagram indices](strings/README.md)
  - [Generate palindrome pairs](strings/README.md)
  - [Print zigzap form](strings/README.md)
  - [Determine smallest rotated string](strings/README.md)

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

## Searching

### Linear Search

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
