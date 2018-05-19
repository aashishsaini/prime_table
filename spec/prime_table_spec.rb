RSpec.describe PrimeTable do
  it "has a version number" do
    expect(PrimeTable::VERSION).not_to be nil
  end

  describe "GetPrimes" do
    let(:primes)  { PrimeTable::GetPrimes.fetch_primes(10) }

    it "#fetch_primes(n) returns 'n' number of prime numbers" do
      expect(primes.length).to eq(10)
    end

    it "validates and return true if number is prime" do
      expect(PrimeTable::GetPrimes.validate_prime?(primes.first)).to be_truthy
    end

    it "validates and return false if number is not prime" do
      expect(PrimeTable::GetPrimes.validate_prime?(4)).to be_falsey
    end

    it "#fetch_primes(n) return valid primes" do
      expect(primes).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it "#fetch_primes(n) returns an empty array if 'n' is 0" do
      primes = PrimeTable::GetPrimes.fetch_primes(0)
      expect(primes).to match_array([])
    end
  end


  describe "TabularView#initialize" do
    let(:subject) { PrimeTable::TabularView.new(n:5)}
    let(:subject2) { PrimeTable::TabularView.new(n:0)}


    it "initializes an instance" do
      expect(subject).to be_a PrimeTable::TabularView
    end

    it "sets @prime_numbers variable to an array" do
      expect(subject.prime_numbers).to match_array([2, 3, 5, 7, 11])
    end

    it "sets @prime_numbers to '0' if 'n' is zero" do
      expect(subject2.prime_numbers).to be_empty
    end

    it "initializes a table instance variable" do
      expect(subject.table).to be_empty
    end
  end

  describe "TabularView#generate_table" do
    let(:subject) { PrimeTable::TabularView.new(n:5)}
    let(:subject2) { PrimeTable::TabularView.new(n:0)}
    let(:primes)  { PrimeTable::GetPrimes.fetch_primes(10) }

    it "adds rows to the table" do
      subject.tableize
      expect(subject.table.length).to eq(6)
    end

    it "table is empty if there are no prime numbers" do
      subject2.tableize
      expect(subject.table.length).to eq(0)
    end
  end
end
