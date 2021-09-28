class OysterCard
  attr_accessor :balance, :entry_station, :list_of_journeys, :journey_hash

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @list_of_journeys = []
    @journey_hash = {}
  end

  def top_up(amount)
    raise("Top_up would exceed #{MAXIMUM_BALANCE}") if balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(entry_station)
    raise("Less than minimum balance of #{MINIMUM_BALANCE}") if balance < MINIMUM_BALANCE
    self.entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(1)
    self.entry_station = nil
  end

  def in_journey?
    !entry_station.nil?
  end

  private

  def deduct(amount)
    self.balance -= amount
  end
end
