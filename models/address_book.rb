# #8 - load library entry.rb relative to address_book.rb's file path
require_relative 'entry'
require "csv"

  class AddressBook
    attr_reader :entries

    def initialize
      @entries = []
    end

  def add_entry(name, phone_number, email)
    # #9 - create variable to store insertion index
    index = 0
    entries.each do |entry|
    # #10 - compare name to current entry to find index to insert at
      if name < entry.name
        break
      end
      index+= 1
    end
    # #11 - insert new entries using calculated index
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  # #7 - The result of CSV.parse is an object of type CSV::Table
  def import_from_csv(file_name)
    # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # #8 - iterate over the CSV::Table object's rows, create a hash for each row, and convert each row_hash to an Entry 
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
end
