class OysterCard
  attr_accessor :balance, :in_journey
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise("Top_up would exceed #{MAXIMUM_BALANCE}") if balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

end
