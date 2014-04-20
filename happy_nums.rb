# Write a method to determine if a given positive integer is "happy". A number is happy if the sum of the square of its
# digits eventually returns one. A number is not happy if it ends up in an infinite loop.

class Fixnum
  @@happies = { 1 => nil }
  @@unhappies = Hash.new

  def self.happies; @@happies end
  def self.unhappies; @@unhappies end
  def is_happy; Fixnum.do_is_happy(self, {}) end
  def happy_equiv; to_s.gsub('0', '').chars.sort_by { |c| c }.to_a.join.to_i end

  private
  def self.do_is_happy(number, possible_happies)
    num = number.happy_equiv
    return false if @@unhappies.has_key? num

    if @@happies.has_key? num
      @@happies.merge! possible_happies
      true
    elsif possible_happies.has_key? num
      @@unhappies.merge! possible_happies
      false
    else
      possible_happies[num] = nil
      do_is_happy num.to_s.chars.map(&:to_i).inject(0) { |sum_and_square, i| sum_and_square += i**2 }, possible_happies
    end
  end
end

puts 'The happies, up to 100...'

puts '1 ' + 1.is_happy.to_s
puts '7 ' + 7.is_happy.to_s
puts '10 ' + 10.is_happy.to_s
puts '13 ' + 13.is_happy.to_s
puts '19 ' + 19.is_happy.to_s
puts '23 ' + 23.is_happy.to_s
puts '28 ' + 28.is_happy.to_s
puts '31 ' + 31.is_happy.to_s
puts '32 ' + 32.is_happy.to_s
puts '44 ' + 44.is_happy.to_s
puts '49 ' + 49.is_happy.to_s
puts '68 ' + 68.is_happy.to_s
puts '70 ' + 70.is_happy.to_s
puts '79 ' + 79.is_happy.to_s
puts '82 ' + 82.is_happy.to_s
puts '86 ' + 86.is_happy.to_s
puts '91 ' + 91.is_happy.to_s
puts '94 ' + 94.is_happy.to_s
puts '97 ' + 97.is_happy.to_s
puts '100 ' + 100.is_happy.to_s

puts "\nA few unhappies..."

puts '2 ' + 2.is_happy.to_s
puts '3 ' + 3.is_happy.to_s
puts '4 ' + 4.is_happy.to_s
puts '5 ' + 5.is_happy.to_s
puts '6 ' + 6.is_happy.to_s
puts '8 ' + 8.is_happy.to_s
puts '9 ' + 9.is_happy.to_s
puts '11 ' + 11.is_happy.to_s
puts '12 ' + 12.is_happy.to_s
puts '14 ' + 14.is_happy.to_s

puts "Give it a try..."
puts gets.to_i.is_happy.to_s

puts "All the happies we found: " + Fixnum.happies.keys.sort.inspect
puts "All the unhappies we found: " + Fixnum.unhappies.keys.sort.inspect

=begin
=end