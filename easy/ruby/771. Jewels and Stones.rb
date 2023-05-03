# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
# Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

# The letters in J are guaranteed distinct, and all characters in J and S are letters.
# Letters are case sensitive, so "a" is considered a different type of stone from "A".

# Example 1:

# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:

# Input: J = "z", S = "ZZ"
# Output: 0
# Note:

# S and J will consist of letters and have length at most 50.
# The characters in J are distinct.

# Solution 1
# Make a dict to store counts for all characters in Stones
# Then add all the counts if it's in Jewels string
# O(m+n)
def num_jewels_in_stones(j, s)
  dict = s.chars.each_with_object(Hash.new(0)) do |char, hash|
      hash[char] += 1
  end
  
  j.chars.sum{|char| dict[char]}
end

# Solution 2
# traverse Stones and add to count if Jewels include it
# O(m*n)
def num_jewels_in_stones(j, s)
  ss = s.split(//)
  count = 0
  ss.each{|s| count += 1 if j.include?(s)}
  count
end