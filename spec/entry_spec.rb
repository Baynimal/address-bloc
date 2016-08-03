require_relative '../models/entry'

RSpec.describe Entry do

  describe "attributes" do
    let(:entry) { Entry.new('Uhtred Beddanburgh', '253.777.8888' , 'UhtredofBeddanburg@northumbria.org') }

  it " responds to name " do
    expect(entry).to respond_to(:name)
  end

  it "reports its name" do
    expect(entry.name).to eq('Uhtred Beddanburgh')
  end

  it "responds to phone number" do
    expect(entry).to respond_to(:phone_number)
  end

  it "reports its phone_number" do
    expect(entry.phone_number).to eq('253.777.8888')
  end

  it "responds to email" do
    expect(entry).to respond_to(:email)
  end

  it "reports its email" do
  expect(entry.email).to eq('UhtredofBeddanburg@northumbria.org')
  end

end
end

  describe "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Uhtred Beddanburgh', '253.777.8888' , 'UhtredofBeddanburg@northumbria.org')
      expected_string = "Name: Uhtred Beddanburgh\nPhone Number: 253.777.8888\nEmail: UhtredofBeddanburg@northumbria.org"
      expect(entry.to_s).to eq(expected_string)
    end
  end
