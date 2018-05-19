require_relative "prime_table/version"

module PrimeTable
  LESS_THAN_ZERO = 'Generating default set of 10 as your entered values is less than 0'

  # Helper class to extract the prime numbers.
  class GetPrimes
    def self.fetch_primes(n)
      collection = []

      # will only run if the number of prime values to be fetched should be >= 1
      # and keep on circling back unless fetch the number of prime numbers requested by requester.
      while collection.length < n
        # initialize the first prime number
        # and extracts the next prime number that needs to be evaluated
        i ||= 2

        # push to the result set if number is found as prime number
        collection << i if self.validate_prime?(i)

        # extract the next prime number
        i += (i==2 ? 1 : 2)
      end if n >= 1

      collection
    end

    # check if the number is prime or not
    def self.validate_prime?(num)
      # use none enum so as to check if any of the iterator satisfies the block condition or not.
      (2..Math.sqrt(num)).none? { |i| (num % i).zero? }
    end
  end

  class TabularView
    # defining the state attributes
    attr_reader :prime_numbers, :table

    # initialize new object with default 10 prime numbers
    def initialize(n: 10)
      @table = []
      @prime_numbers = GetPrimes.fetch_primes(n)
    end

    # shows the product output in STDOUT in tabular form
    def tableize
      # format the header of the table
      # join all prime numbers with the calculated str_separator
      table_header = "%#{str_separator}s" % '#' # put '#' so to indicate the pointer to row and column conjunction
      @table <<  (table_header << @prime_numbers.collect {|s| "%#{str_separator+1}s" % s}.join(''))

      # get the multiplier value of the prime number with others
      @prime_numbers.map do |x|
        # push the value for the first column of the table
        str = "%#{str_separator}s" % x

        # extract the column values apart for subsequent columns
        @prime_numbers.collect{|w| str << "%#{str_separator+1}s" % (x * w) }

        # puts formatted string to table array
        @table << str
      end

      # displays the table on STDOUT
      @table
    end

    private

    # calculate the number of spaces needed to indent the table column values
    def str_separator
      # assuming the last value to be the max in array and should have biggest square value
      # which further converted to string to extract the length
      ((@prime_numbers.last || 1)**2).to_s.length
    end
  end
end
