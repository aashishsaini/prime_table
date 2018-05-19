
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prime_table/version"

Gem::Specification.new do |spec|
  spec.name          = "prime_table"
  spec.version       = PrimeTable::VERSION
  spec.authors       = ["Aashish Saini"]
  spec.email         = ["aashusaini2684@gmail.com"]

  spec.summary       = %q{Prints the table that has N prime numberss, with each cell containing the product of the primes for the corresponding row and column}
  spec.description   = %q{Prints the table that has N prime numberss, with each cell containing the product of the primes for the corresponding row and column}
  spec.homepage      = "http://rubygems.org/gems/prime_table"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://aashish.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
