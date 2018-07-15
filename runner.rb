require 'unirest'

# puts "Enter new email:"
# email = gets.chomp

# hardcoded for delete worked 07-15-18 and changed current user to true @60 users_controller...

response = Unirest.delete("http://localhost:3000/users/7").body

# hardcoded for update worked 07-15-18 and changed current user to true @38 users_controller... 
# params = {
#  email: "ee@ee.com"
# }

# response = Unirest.patch("http://localhost:3000/users/7", parameters: params).body


# # puts "What recipe id would you like to update?"
# # recipe_id = gets.chomp

# # params = {
# #   # title: "Cake!!!",
# #   chef: "Stephen C",
# #   ingredients: "Flour, eggs, sugar",
# #   directions: "Bake",
# #   prep_time: 45
# # }

# # response = Unirest.patch("http://localhost:3000/api/recipes/#{recipe_id}", parameters: params).body

# # puts JSON.pretty_generate(response)


# puts "What recipe id would you like to destroy?"
# recipe_id = gets.chomp

# response = Unirest.delete("http://localhost:3000/api/recipes/#{recipe_id}").body

# puts JSON.pretty_generate(response)

# response = Unirest.post(
#   "http://localhost:3000/users",
#   parameters: {
#     name: "Dani",
#     email: "dani@gmail.com",
#     password: "123",
#     password_confirmation: "123"
#   }
# )
# p response.body


# response = Unirest.post(
#   "http://localhost:3000/user_token",
#   parameters: {
#     auth: {
#       email: "dani@gmail.com",
#       password: "123"
#     }
#   }
# )
