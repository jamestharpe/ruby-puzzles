# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these
# multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

def multiples_of(number, upTo)
  result = Array.new
  (0..upTo).step(number) do |n|
    result << n
  end
  puts result.inspect
  result
end

puts multiples_of(5, 999).inject(:+) + multiples_of(3, 999).inject(:+) - multiples_of(15, 999).inject(:+)