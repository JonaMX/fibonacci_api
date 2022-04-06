class Fibonacci
  def self.sequence
    current = 0
    nxt = 1
    Enumerator.produce do |prev|
      output = current
      current, nxt = nxt, nxt + current
      output
    end
  end

  def self.at position
    enum = sequence
    sequence.take(position + 1).last
  end
end