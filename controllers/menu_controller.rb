# #1 -- include AddressBook
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    # #2 - display options to command line
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    # #3 - retrieve user input from command line
    selection = gets.to_i

    # #7 - use case to determine proper response to user input
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        # #8 - terminate program. 0 signals program to exit w/o error.
        exit(0)
      # #9 - use else to catch invalid user input and prompt retry
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  # #10 - stub the rest of the methods called in main_menu
  def view_all_entries
    # #14 - iterate through all entries in AddressBook
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      # #15 call entry_submenu to display submenus for each entry
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    # #11 - clear screen before displaying create entry prompt
    system "clear"
    puts "New AddressBloc Entry"
    # #12 - prompt user for each Entry attribute
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    # #13 - add a new entry using add_entry
    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_submenu(entry)
    # #12 - print out submenu
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    # #13 - save user input to selection
    selection = gets.chomp

    # #14 - actions based on user inputs.
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end

  def search_entries
    # #9 - store "name" in name
    print "Search by name: "
    name = gets.chomp
    # #10 - call search. will return a match or nil since import_from_csv will fail w/o name.
    match = address_book.binary_search(name)
    system "clear"
    # #11 - check if search returned a match
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    # #4 - print out updated info
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
    # #5 - set new attributes if valid attribute was given via user input
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    # #6 - print out updated attributes
    puts "Updated entry:"
    puts entry
  end

  def read_csv
    # #1 - user prompt for CSV
    print "Enter CSV file to import: "
    file_name = gets.chomp

    # #2 - check to see if file name is empty
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    # #3 - import specified file. begin will protect from crashes if exception is thrown, then continue with the rescue statement.
    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end

  def entry_submenu(entry)
    # #16 - display submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    # #17 - chomp removes trailing whitespace from string gets returns
    selection = gets.chomp

    case selection
      when "n"
      when "d"
        delete_entry(entry)
      when "e"
        # #8 call edit_entry then display submenu
        edit_entry(entry)
        entry_submenu(entry)
    # #20 - return user to main menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

end
