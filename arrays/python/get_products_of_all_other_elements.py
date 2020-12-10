# Arrays - Get Products of all other elements in Python

# Generates prefix products
def build_prefix_products(nums):
  prefix_products = []

  for num in nums:
    if prefix_products:
      prefix_products.append(prefix_products[-1] * num)
    else:
      prefix_products.append(num)
  return prefix_products

# Generates suffix products
def build_suffix_products(nums):
  suffix_products = []

  for num in reversed(nums):
    if suffix_products:
      suffix_products.append(suffix_products[-1] * num)
    else:
      suffix_products.append(num)

  return suffix_products

# Builds output
def output(prefix_products, suffix_products, nums):
  result = []

  for i in range(len(nums)):
    if i == 0:
      result.append(suffix_products[i + 1])
    elif i == len(nums) - 1:
      result.append(prefix_products[i - 1])
    else:
      result.append(prefix_products[i - 1] * suffix_products[i + 1])
  return result

# Generates result from the product of prefixes and suffixes
def products(nums):
  prefix_products = build_prefix_products(nums)
  suffix_products = build_suffix_products(nums)
  suffix_products = list(reversed(suffix_products))

  return output(prefix_products, suffix_products, nums)

print(products([1, 2, 3]))
# => [6, 3, 2]
