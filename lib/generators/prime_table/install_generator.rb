module PrimeTable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../table_generator_example.rb", __FILE__)
      desc "copies the example rb to root directory"

      def copy_initializer
        template '../table_generator_example.rb', '../'
      end
    end
  end
end