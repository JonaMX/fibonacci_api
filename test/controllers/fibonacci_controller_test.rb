require "test_helper"

KNOWN_FIBONACCI_SEQUENCE = [0, 1, 1, 2, 3, 5, 8, 13]
INVALID_NUMBER = "abc"
TEST_POSITION = 5

class FibonacciControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fibonacci_path(TEST_POSITION)
    assert_response :success
  end

  test "should get an error when given position is not a valid number" do
    get fibonacci_path(INVALID_NUMBER)
    assert_response 400
  end

  test "should get the value for the fibonacci sequence for a given position" do
    get fibonacci_path(TEST_POSITION)
    assert_response 200, KNOWN_FIBONACCI_SEQUENCE[TEST_POSITION]
  end
end