require "./lib/oystercard.rb"

describe OysterCard do
  let(:station) { double("Paddington") }

  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "tops up the card with money" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "raises an error if balance tries to exceed £90" do
    expect{ subject.top_up(OysterCard::MAXIMUM_BALANCE + 1) }.to raise_error("Top_up would exceed #{OysterCard::MAXIMUM_BALANCE}")
  end

  it "raises an error if the balance is less than minimum balance on touch_in" do
    subject.balance = 0
    expect { subject.touch_in(station) }.to raise_error("Less than minimum balance of #{OysterCard::MINIMUM_BALANCE}")
  end

  it "confirms that touch in sets in_journey to true" do
    subject.balance = 10
    subject.touch_in(station)
    expect(subject.in_journey?).to be_truthy
  end

  it "confirms that touch out sets in_journey to false" do
    subject.balance = 10
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.in_journey?).to be_falsy
  end

  it "deducts the correct fare on touch out" do
    subject.balance = 10
    expect {subject.touch_out(station)}.to change {subject.balance}.by(-1)
  end

  it "remembers the entry station on touch in" do
    subject.balance = 10
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it "forgets the entry station on touch out" do
    subject.balance = 10
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.entry_station).to be_nil

  end

  it "has an empty list of journeys by default" do
    expect(subject.list_of_journeys).to be_empty
  end

end


