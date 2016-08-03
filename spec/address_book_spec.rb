require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) {AddressBook.new}

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end


  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries and an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq (0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Uhtred Beddanburgh', '253.777.8888', 'UhtredofBeddanburg@northumbria.org')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Uhtred Beddanburgh', '253.777.8888', 'UhtredofBeddanburg@northumbria.org')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Uhtred Beddanburgh')
      expect(new_entry.phone_number).to eq('253.777.8888')
      expect(new_entry.email).to eq ('UhtredofBeddanburg@northumbria.org')
    end
  end

  describe "remove_entry" do
     it "removes only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Uhtred Beddanburgh', '253.777.8888', 'UhtredofBeddanburg@northumbria.org')
      book.remove_entry('Uhtred Beddanburgh', '253.777.8888', 'UhtredofBeddanburg@northumbria.org')
      expect(book.entries.size).to eq(0)
    end
  end

  describe "import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eq 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Ragnar", "253-333-4444", "ragnar@ragnar.com"  )
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Alfred", "253-222-1111", "alfred@alfred.com"  )

    end

    it "imports the 3nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[2]
      check_entry(entry_three, "Brida", "253-333-5555", "brida@brida.com"  )

    end

    it "imports the 4nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[3]
      check_entry(entry_four, "Aethelred", "253-222-6666", "aethelred@aethelred.com"  )
    end

    it "imports the 5nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[4]
      check_entry(entry_three, "Leofreych", "253-222-7777", "leofreych@leofreych.com"  )
    end
  end



end
