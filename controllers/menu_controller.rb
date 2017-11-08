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
    puts "5 - View Entry n"
    puts "6 - Exit"
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
        system "clear"
        entry_n_submenu
        main_menu
      when 6
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

  def entry_n_submenu
    print "Entry number to view: "
    selection = gets.chomp.to_i

    if selection < @address_book.entries.count
      puts @address_book.entries[selection-1]
      puts "Press enter to return to main menu"
      gets.chomp
      system "clear"
    else
      puts "#{selection} is not valid"
      entry_n_submenu
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

  def search_entries
  end

  def read_csv
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
    # #18 - do nothing for now and return to view_all_entries
      when "n"
    # #19 - for now we show next entry
      when "d"
      when "e"
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
