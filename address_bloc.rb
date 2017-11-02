require_relative 'controllers/menu_controller'

# #4 - create new MenuController upon start
menu = MenuController.new
# #5 - clears command line
system "clear"
puts "Welcome to AddressBloc!"
# #6 calls main_menu to display the menu
menu.main_menu
