class OysterCard
  attr_accessor :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise("Top_up would exceed #{MAXIMUM_BALANCE}") if balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end
end
