list = [0, 3, 5, 4, -5, 10, 1, 90]

## Phase I
def my_min_1(array)
  array.each do |el1|
    el1_is_smallst = true
    array.each do |el2|
      if el1 > el2
        el1_is_smallst = false
      end
    end
    return el1 if el1_is_smallst
  end
end
# p my_min_1(list)
# O(n**2)

## PHase II
def my_min_2(array)
  smallest = nil
  array.each do |num|
    smallest ||= num
    smallest = num if num < smallest
  end
  smallest
end
# p my_min_2(list)
# O(n)

list = [5, 3, -7]

## Phase I
def largest_contiguous_subsum_1(list)
  sub_sets = []

  list.each_index do |idx1|
    idx1.upto(list.length - 1) do |idx2|
      sub_sets << list[idx1..idx2]
    end
  end

  sub_sets_sum = []

  sub_sets.each do |sub_set|
    sub_sets_sum << sub_set.reduce(:+)
  end

  biggest = nil
  sub_sets_sum.each do |num|
    biggest ||= num
    biggest = num if num > biggest
  end

  biggest
end

## Phase II
def largest_contiguous_subsum_2(list)
  biggest_sum = nil
  running_sum = 0

  list.each do |num|
    running_sum += num
    biggest_sum ||= running_sum
    biggest_sum = running_sum if running_sum > biggest_sum
    running_sum = 0 if running_sum < 0
  end

  biggest_sum
end
