# Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.

# Example 1:

# Input: "Hello"
# Output: "hello"
# Example 2:

# Input: "here"
# Output: "here"
# Example 3:

# Input: "LOVELY"
# Output: "lovely"

# Solution 1
# Ruby string method #downcase

# Solution 2
# Using character encoding codepoint to transform to lowercase
def to_lower_case(str)
  (0..str.size - 1).each do |index|
    if str[index].ord >= 65 && str[index].ord < 91
        str[index] = (str[index].ord + 32).chr
    end
  end

  str
end