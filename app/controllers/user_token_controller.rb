class UserTokenController < Knock::AuthTokenController
  protect_from_forgery with: :null_session

  def create
    email = request.params["auth"] && request.params["auth"]["email"]    
    password = request.params["auth"] && request.params["auth"]["password"]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      body = {
        jwt: auth_token.token,
        user: { id: user.id, first_name: user.first_name, last_name: user.last_name, email: user.email }
      }
      render json: body, status: :created
    else
      render json: {}
    end
  end
end
