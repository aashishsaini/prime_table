# PrimeTable

###Objective
* Write a program that prints out a multiplication table of the first 'n' prime
numbers.(where n could be any number greater than 0)
* The program could be run from the command line and print one table to
STDOUT, or can be used as service to get the table in array to use on view.
* The first row and column of the table should have the 'n' primes, with each cell containing the product of the primes for the corresponding row and column.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'generate_prime_table'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install generate_prime_table

## Usage

###There are three ways to extract the result:
* Install the gem locally
* And
    * Create a ruby file and add the following to it:
    ```
        require_relative 'lib/prime_table'
        
        puts 'Enter the number'
        @num = gets.chomp
        @num = @num.to_i
        puts PrimeTable::LESS_THAN_ZERO if @num <= 0
        puts "Generating prime product table for #{@num} records" if @num > 0
        table = @num <= 0 ? PrimeTable::TabularView.new : PrimeTable::TabularView.new(n:@num.to_i)
        puts table.tableize
    
    ```

    *  extract the result on console

    ```
        require 'prime_table'
        @num = 10        
        table = PrimeTable::TabularView.new(n:@num.to_i)
        puts table.tableize
    ```
    * try to use it as gem in application code base
    ```
        add "gem 'generate_prime_table'" to gemfile
        bundle install
        add the following in any model/module/helper file
            require_relative 'lib/prime_table'
            def table(num)
                @table = @num <= 0 ? PrimeTable::TabularView.new : PrimeTable::TabularView.new(n:@num.to_i)
                @table.tableize
            end
    ```
    
##How to Run it using github code
clone the repo and run
    ```
    'ruby table_generator_example.rb'
    ```

##Complexity Considerations:
* Generating the multiplication table is O(n**2) complexity since we have to multiply each prime by it's corresponding counterpart
* Displaying the table is O(n) since we're just iterating through the table and displaying each row. (there are 'n' number of rows)


##Notes
• Consider complexity. How fast does your code run? How does it scale?
- As the 'N' gets bigger the program is going to start slowing down because we are using trial division to determine if the number is prime. However, for small 'n' number of primes this solution will suffice.

• Did not use the Prime class from stdlib, written custom class for it.

• Written tests to demonstrate TDD/BDD.

##Approach

GetPrimes Class
* Created a GetPrimes class which will instantiate 'n' number of primes

####Compute Primes Multiplication
* Computed the value of multiplied primes

####Displays the Multiplication Table
* Creates a TabularView class and calls methods to display the table.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/prime_table. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PrimeTable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/prime_table/blob/master/CODE_OF_CONDUCT.md).
