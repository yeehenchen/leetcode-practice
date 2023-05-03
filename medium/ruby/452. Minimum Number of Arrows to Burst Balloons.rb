# There are a number of spherical balloons spread in two-dimensional space.
# For each balloon, provided input is the start and end coordinates of the horizontal diameter.
# Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice.
# Start is always smaller than end. There will be at most 104 balloons.

# An arrow can be shot up exactly vertically from different points along the x-axis.
# A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend.
# There is no limit to the number of arrows that can be shot.
# An arrow once shot keeps travelling up infinitely.
# The problem is to find the minimum number of arrows that must be shot to burst all balloons.

# Example:

# Input:
# [[10,16], [2,8], [1,6], [7,12]]

# Output:
# 2

# Explanation:
# One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6])
# and another arrow at x = 11 (bursting the other two balloons).

# Solution
# to find the maximum non overlapping intervals
# => sort by right end first
# => for each loop check if new range is overlapping
#    if overlapped, do nothing
#    if not overlapped, update right end value and add count
def find_min_arrow_shots(points)
  right_end = nil
  count = 0

  points.sort!{|a,b| a[1] <=> b[1]}
  points.each do |point|
    if right_end.nil? || point[0] > right_end
      right_end = point[1]
      count += 1
    end
  end

  count
end
