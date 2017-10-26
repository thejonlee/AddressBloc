# #8 - load library entry.rb relative to address_book.rb's file path
require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def remove_entry(name, phone_number, email)
    delete_entry = nil

    @entries.each do |entry|
      if name == entry.name && phone = entry.phone_number && email == entry.email
        delete_entry = entry
      end
    end

    @entries.delete(delete_entry)
    
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
end
