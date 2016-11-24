## Brute Force: O(n**2)
def two_sum_1?(array, target_sum)
  array.each_with_index do |num1, idx1|
    array.each_with_index do |num2, idx2|
      next if idx1 == idx2
      return true if num1 + num2 == target_sum
    end
  end
  false
end

## Sorting: O(n(log(n)))
def two_sum_2?(array, target_sum)
  array.sort!
  array.each_with_index do |el, idx|
    idx2 = bsearch(array, target_sum - el)
    return true unless idx2.nil? || idx == idx2
  end
  false
end

def bsearch(array, target_sum)
  return nil if array.empty?

  midpoint = array.length / 2

  case array[midpoint] <=> target_sum
  when -1
    sub_result = bsearch(array.drop(midpoint + 1), target_sum)
    sub_result.nil? ? nil : sub_result + midpoint + 1
  when 0
    midpoint
  when 1
    bsearch(array.take(midpoint), target_sum)
  end
end

## Hash Map: O()
def two_sum_3?(array, target_sum)
  # number_hash = Hash.new() { |h, k| h[k] = []}
  #
  # array.each_with_index do |number, index|
  #   number_hash[index] = target_sum - number
  # end
  #
  # # array.each_with_index do |number, index|
  # #   return true if
  # # end
  #
  # number_hash
  return false if array.length < 2
  hash = Hash.new(false)

  array.each do |el|
    hash[target_sum - el] = true
  end

  array.each do |el|
    return true if hash[el]
  end
  false
end
