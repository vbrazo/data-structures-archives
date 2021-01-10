# Given two sorted integer arrays nums1 and nums2,
# merge nums2 into nums1 as one sorted array.

# The number of elements initialized in nums1 and nums2 are m and n respectively.
# You may assume that nums1 has enough space (size that is equal to m + n)
# to hold additional elements from nums2.

# easist way to do this is using pure Ruby functions
def merge(nums1, m, nums2, n)
  return nums1 if nums2.length == 0

  nums = (nums1 + nums2).select { |num| num.positive? }
  sorted_array = nums.sort

  print("#{sorted_array}")
end

nums1 = [1,2,3,0,0,0]
m = 3

nums2 = [2,5,6]
n = 3

merge(nums1, m, nums2, n)
# => [1,2,2,3,5,6]

nums1 = [1]
m = 1
nums2 = []
n = 0

merge(nums1, m, nums2, n)
# => [1]
