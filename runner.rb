require 'unirest'

# update dollar
# params = {
#  serial_num: "L12345678B"
# }

# response = Unirest.patch("http://localhost:3000/api/dollars/2", parameters: params).body

#update ark
# params = {
#  image: "http://dekalbcounty.org/RNC/photos/05.jpg"
# }

# response = Unirest.patch("http://localhost:3000/api/arks/1", parameters: params).body



#create ark, ark requires dollar to exist, code appropriately later

# response = Unirest.post(
#   "http://localhost:3000/api/arks",
#   parameters: {
#   description: "After being rescued with a dead phone via a car charger for a S9, in a foreign land with no information other than what was in Match.com after visiting 5 stores, Anton at Walgreens was kind and saved my evening and maybe more, as I was able to call my first date, albeit 40 minutes past the 8pm ballpark and a magical evening was had, so my kindness was to go to walgreens site and send a note about how the employee saved me and did so very kindly after several misses at other stores in the area",
#             user_id: 1,
#             image: "http://quotesnsmiles.com/wp-content/uploads/2013/07/1.a-drop-of-kindness-picture-quotes.jpg",
#             location: "online post visit to Walgreens Merrillville, Indiana",
#             dollar_id: 2
#   }
# )
# p response.body

# hardcoded for delete worked 07-15-18 and changed current user to true @60 users_controller...

# response = Unirest.delete("http://localhost:3000/users/7").body

# hardcoded for update worked 07-15-18 and changed current user to true @38 users_controller... 
# params = {
#  email: "ee@ee.com"
# }

# response = Unirest.patch("http://localhost:3000/users/7", parameters: params).body


# # puts "What recipe id would you like to update?"
# # recipe_id = gets.chomp  #keeping as chomp reminder




