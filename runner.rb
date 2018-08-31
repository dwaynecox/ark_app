require 'unirest'

#update ark
# params = {
#  image: "http://dekalbcounty.org/RNC/photos/05.jpg"
# }

# response = Unirest.patch("http://localhost:3000/api/arks/1", parameters: params).body

response = Unirest.post(
  "http://localhost:3000/api/arks",
  parameters: {
  description: "Turned around while walking home to hold door for restaurant delivery guy",
            user_id: 1,
            image: "",
            serial_num: "runner bingo",
            location: "Papa Passeros, Westmont, IL"
          
  }
)
p response.body

# hardcoded for delete worked 07-15-18 and changed current user to true @60 users_controller...

# response = Unirest.delete("http://localhost:3000/users/7").body

# hardcoded for update worked 07-15-18 and changed current user to true @38 users_controller... 
# params = {
#  email: "ee@ee.com"
# }

# response = Unirest.patch("http://localhost:3000/users/7", parameters: params).body


# # puts "What recipe id would you like to update?"
# # recipe_id = gets.chomp  #keeping as chomp reminder




