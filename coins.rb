COINS = [25, 10, 5, 1]
def num_ways(n)
  count_ways(n, 0)
end

def count_ways(n, start)
    return 1 if n == 0
    return 0 if n < 0 || start >= COINS.length

    count_ways(n - COINS[start], start) +
    count_ways(n, start + 1)
end



p num_ways(100)
