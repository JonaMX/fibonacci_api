class FibonacciController < ApplicationController
  before_action :validate_params, only: [:index]
  DECIMAL_RADIX = 10

  def index
    validate_params
    render json: Fibonacci.at(Integer(params[:position], DECIMAL_RADIX))
  end

  private
  def is_valid_number? number
    true if Integer(number, DECIMAL_RADIX) rescue false
  end

  def validate_params
    render json: { error: 'Invalid input' }, status: 400 unless is_valid_number?(params[:position])
  end
end
