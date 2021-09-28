require "./lib/oystercard.rb"

describe OysterCard do
  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "tops up the card with money" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "reduces the balance" do
    subject.balance = 70
    subject.deduct(10)
    expect(subject.balance).to eq 60
  end

  it "raises an error if balance tries to exceed £90" do
    expect{ subject.top_up(OysterCard::MAXIMUM_BALANCE + 1) }.to raise_error("Top_up would exceed #{OysterCard::MAXIMUM_BALANCE}")
  end

  it "confirms that touch in sets in_journey to true" do
    subject.touch_in
    expect(subject.in_journey?).to be_truthy
  end

  it "confirms that touch out sets in_journey to false" do
    subject.in_journey = true
    subject.touch_out
    expect(subject.in_journey?).to be_falsy
  end

end


