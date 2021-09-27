require "./lib/oystercard.rb"

describe OysterCard do
  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end
end
