# Given numBottles full water bottles, you can exchange numExchange empty water bottles for one full water bottle.
# The operation of drinking a full water bottle turns it into an empty bottle.
# Return the maximum number of water bottles you can drink.

def num_water_bottles(num_bottles, num_exchange)
  res = 0
  empties = 0
  while num_bottles > 0
    res += num_bottles
    empties += num_bottles
    num_bottles = empties / num_exchange
    empties %= num_exchange
  end
  
  res
end