require "test_helper"

KNOWN_FIBONACCI_SEQUENCE = [0, 1, 1, 2, 3, 5, 8, 13]
TEST_POSITION = 5

class FibonacciTest < ActiveSupport::TestCase
  test "sequence method should return an Enumerator obect" do
    assert_instance_of(Enumerator, Fibonacci.sequence)
  end

  test "sequence method should iterate over a valid fibonacci sequence" do
    enum = Fibonacci.sequence
    KNOWN_FIBONACCI_SEQUENCE.each { |element| assert_equal(element, enum.next) }
  end

  test "at method should return the value for the fibonacci sequence for a given position" do
    assert_equal(KNOWN_FIBONACCI_SEQUENCE[TEST_POSITION], Fibonacci.at(TEST_POSITION))
  end
end