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
      check_entry(entry_one, "Aethelred", "253-222-6666", "aethelred@aethelred.com"  )
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Alfred", "253-222-1111", "alfred@alfred.com"  )
    end

    it "imports the 3nd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Brida", "253-333-5555", "brida@brida.com"  )
    end

    it "imports the 4nd entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Leofreych", "253-222-7777", "leofreych@leofreych.com"  )
    end

    it "imports the 5nd entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Ragnar", "253-333-4444", "ragnar@ragnar.com"  )
    end
  end

  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end
  end


  it "searches AddressBook for Ragnar" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Ragnar")
    expect(entry).to be_a Entry
    check_entry(entry, "Ragnar", "253-333-4444", "ragnar@ragnar.com"  )
  end

  it "searches AddressBook for Alfred" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Alfred")
    expect(entry).to be_a Entry
    check_entry(entry, "Alfred", "253-222-1111", "alfred@alfred.com"  )
  end

  it "searches AddressBook for Brida" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Brida")
    expect(entry).to be_a Entry
    check_entry(entry, "Brida", "253-333-5555", "brida@brida.com"  )
  end

  it "searches AddressBook for Aethelred" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Aethelred")
    expect(entry).to be_a Entry
    check_entry(entry, "Aethelred", "253-222-6666", "aethelred@aethelred.com"  )
  end

  it "searches AddressBook for Leofreych" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Leofreych")
    expect(entry).to be_a Entry
    check_entry(entry, "Leofreych", "253-222-7777", "leofreych@leofreych.com"  )
  end

  it "searches AddressBook for Billy" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Billy")
    expect(entry).to be_nil
  end

  it "imports the 1st entry" do
    book.import_from_csv("entries_2.csv")
    entry_one = book.entries[0]
    check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
  end

  it "imports the 2nd entry" do
    book.import_from_csv("entries_2.csv")
    entry_two = book.entries[1]
    check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
  end

  it "imports the 3nd entry" do
    book.import_from_csv("entries_2.csv")
    entry_three = book.entries[2]
    check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
  end

  it "imports the 4nd entry" do
    book.import_from_csv("entries_2.csv")
    entry_four = book.entries[3]
    check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
  end

  it "imports the 5nd entry" do
    book.import_from_csv("entries_2.csv")
    entry_five = book.entries[4]
    check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
  end

end
