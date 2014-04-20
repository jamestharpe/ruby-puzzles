# Write a method to convert a positive integer to words. For example: 7,654,321 return "seven million six hundred
# fifty four thousand three hundred twenty one"

class Fixnum
  def to_words
    words_for_1_through_19 = {
        0 => '', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight',
        9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
        16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }

    return words_for_1_through_19[self] if self < 20

    digits = self.to_s.chars.to_a.map(&:to_i)
    words_for_tens_place_digits = {
        2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty',
        9 => 'ninety' }

    return "#{ words_for_tens_place_digits[digits[0]] } #{ words_for_1_through_19[digits[1]] }".strip if self < 100
    return "#{ words_for_1_through_19[digits[0]] } hundred #{ digits[1,2].join.to_i.to_words }"   if self < 1000

    words_for_number_scales = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion']
    scale_words = digits.reverse.each_slice(3).to_a.reverse.map{ |scale| scale.reverse.join.to_i.to_words }
    scale_names = words_for_number_scales[0, scale_words.length].reverse.map{ |name| name += ',' if name != '' }
    [scale_words.to_a, scale_names].transpose.reduce(:+).join(' ').strip
  end
end

puts   '1 ' + 1.to_words
puts "\n12 " + 12.to_words
puts "\n123 " + 123.to_words
puts "\n1,234 " + 1234.to_words
puts "\n12,345 " + 12345.to_words
puts "\n123,456 " + 123456.to_words
puts "\n1,234,567 " + 1234567.to_words
puts "\n12,345,678 " + 12345678.to_words
puts "\n123,456,789 " + 123456789.to_words
puts "\n1,234,567,890 " + 1234567890.to_words
puts "\n12,345,678,901 " + 12345678901.to_words
puts "\n123,456,789,012 " + 123456789012.to_words
puts "\n1,234,567,890,123 " + 1234567890123.to_words
puts "\n12,345,678,901,234 " + 12345678901234.to_words
puts "\n123,456,789,012,345 " + 123456789012345.to_words
puts "\n1,234,567,890,123,456 " + 1234567890123456.to_words
puts "\n12,345,678,901,234,567 " + 12345678901234567.to_words
puts "\n123,456,789,012,345,678 " + 123456789012345678.to_words
puts "\n1,234,567,890,123,456,789 " + 1234567890123456789.to_words
# Too Big # puts "\n12,345,678,901,234,567,890 " + 12345678901234567890.to_words

puts gets.to_i.to_words