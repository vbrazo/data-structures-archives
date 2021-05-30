# frozen_string_literal: true

# Given an array nums of integers, return how many of them contain an even number of digits.

def find_numbers(nums)
  number = 0
  nums.each do |num|
    number += 1 if num.digits.count.even?
  end
  number
end

puts(find_numbers([12, 345, 2, 6, 7896]))
# => 2

puts(find_numbers([555, 901, 482, 1771]))
# => 1

def find_numbers(nums)
  number = 0
  digits = nums.map(&:digits)
  digit_count = digits.map(&:count)
  digit_count.each do |digit|
    number += 1 if digit.even?
  end
  number
end

puts(find_numbers([12, 345, 2, 6, 7896]))
# => 2

puts(find_numbers([555, 901, 482, 1771]))
# => 1

def find_numbers(nums)
  even_nums = []
  nums.each do |i|
    even_nums << i if i.to_s.length.even?
  end
  even_nums.length
end

puts(find_numbers([12, 345, 2, 6, 7896]))
# => 2

puts(find_numbers([555, 901, 482, 1771]))
# => 1
