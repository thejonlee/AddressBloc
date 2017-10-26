require_relative '../models/entry'
 # #1 -- standard first line
 RSpec.describe Entry do
   # #2 -- gives structure, we are testing Entry
   describe "attributes" do
     # #3 -- each 'it' represents a unique test
     # let method allows us to describe entry local variable once instead of repeating
     let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }

     it "responds to name" do
       # #4 -- each Rspec test ends with expect to give expectations
       expect(entry).to respond_to(:name)
     end

     it "reports its name" do
       expect(entry.name).to eq('Ada Lovelace')
     end

     it "responds to phone number" do
       expect(entry).to respond_to(:phone_number)
     end

     it "reports its phone_number" do
       expect(entry.phone_number).to eq('010.012.1815')
     end

     it "responds to email" do
       expect(entry).to respond_to(:email)
     end

     it "reports its email" do
       expect(entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   # #5 -- new describe block to separate to_s from initializer. # indicates an instance method.
   describe "#to_s" do
     it "prints an entry as a string" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
   # #6 -- check to see that to_s returns string equal to expected_string
       expect(entry.to_s).to eq(expected_string)
     end
   end

 end
