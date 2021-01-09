# Given a fixed length array arr of integers, duplicate each occurrence of zero,
# shifting the remaining elements to the right.

# Note that elements beyond the length of the original array are not written.
# Do the above modifications to the input array in place,
# do not return anything from your function.

# Approach 1: a brute force solution using a supporting array
def duplicate_zeros(arr)
  arr2 = []
  d=0
  arr.each_with_index do |value, pointer1|
    if value == 0
      arr2[d]=0
      d=d+1
      arr2[d]=0
    else
      arr2[d]=value
    end

    d=d+1
  end
  print("#{arr2}\n")
end

duplicate_zeros([1,0,2,3,0,4,5,0])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,0,0,2,3,0,0,4]

duplicate_zeros([1,2,3])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,2,3]
