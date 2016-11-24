## Phase I: O(n!)
def anagrams_1?(string, string2)
  permutations = string.chars.permutation
  permutations.include?(string2.chars)
end

## Phase II: O(n**2)
def anagrams_2?(string, string2)
  array1 = string.chars
  array2 = string2.chars
  dup1 = array1.dup

  dup1.each do |letter|
    array1.delete_at(array1.index(letter))
    idx2 = array2.index(letter)
    array2.delete_at(idx2) unless idx2.nil?
    break if array2.empty?
  end

  array1.empty? && array2.empty?
end

## Phase III: O(n*log(n))
def anagrams_3?(string, string2)
  string.chars.sort == string2.chars.sort
end

## Phase IV: O(n)
def anagrams_4?(string, string2)
  letter_hash = Hash.new(0)

  string.each_char { |letter| letter_hash[letter] += 1}
  string2.each_char { |letter| letter_hash[letter] -= 1}

  letter_hash.values.all? { |count| count == 0 }
end
