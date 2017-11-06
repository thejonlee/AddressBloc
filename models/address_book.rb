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

  # Search AddressBook for a specific entry by name
  def binary_search(name)
    # #1 save index of leftmost and rightmost items in the array
    lower = 0
    upper = entries.length - 1

    # #2 - loop while lower index is <= upper
    while lower <= upper
      # #3 - find middle index
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      # #4 - compare name we are searching for and begin divide and conquer 
      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

    # #5 - divide and conquer to wehere no match is found, return nil
    return nil
  end
end
