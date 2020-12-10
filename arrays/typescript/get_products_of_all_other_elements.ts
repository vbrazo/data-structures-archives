function build_prefix_products(nums: Number[]) {
  var prefix_products: Number[] = []
  var i = 0

  while (i < nums.length) {
    if (prefix_products.length > 0) {
        prefix_products.push(Number(prefix_products[prefix_products.length-1]) * Number(nums[i]))
    } else {
        prefix_products.push(Number(nums[i]))
    }
    i++
  }

  return prefix_products
}

function build_suffix_products(nums: Number[]) {
  var suffix_products: Number[] = []
  var i = 0

  while (i < nums.reverse().length) {
    if (suffix_products.length > 0) {
        suffix_products.push(Number(suffix_products[suffix_products.length-1]) * Number(nums[i]))
    } else {
        suffix_products.push(nums[i])
    }
    i++
  }

  return suffix_products
}

function output(prefix_products: Number[], suffix_products: Number[], nums: Number[]) {
  var result: Number[] = []
  var i = 0

  while (i < nums.reverse().length) {
    if (i == 0) {
        result.push(suffix_products[i + 1])
    } else if (i == nums.length - 1) {
        result.push(prefix_products[i - 1])
    } else {
        result.push(Number(prefix_products[i - 1]) * Number(suffix_products[i + 1]))
    }
    i++
  }

  return result
}

function products(nums: Number[]) {
  var prefix_products: Number[] = build_prefix_products(nums)
  var suffix_products: Number[] = build_suffix_products(nums)

  return output(prefix_products, suffix_products.reverse(), nums)
}

console.log(products([1, 2, 3]))
