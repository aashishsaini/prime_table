require_relative 'lib/prime_table'

puts 'Enter the number'
@num = gets.chomp
@num = @num.to_i
puts PrimeTable::LESS_THAN_ZERO if @num <= 0
puts "Generating prime product table for #{@num} records" if @num > 0
table = @num <= 0 ? PrimeTable::TabularView.new : PrimeTable::TabularView.new(n:@num.to_i)
puts table.tableize
