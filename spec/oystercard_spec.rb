require "./lib/oystercard.rb"

describe OysterCard do
  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "tops up the card with money" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
end


