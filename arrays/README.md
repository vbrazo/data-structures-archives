# Arrays

#### Get products of all other elements

Given an array of integers, return a new array such that each element at index `i` of the new array is the product of all the numbers in the original array except the one at `i`.

- [Ruby](ruby/get_products_of_all_other_elements.rb)
- [Python](python/get_products_of_all_other_elements.py)
- [Typescript](typescript/get_products_of_all_other_elements.ts)

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
