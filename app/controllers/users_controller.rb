class UsersController < ApplicationController

  # before_action :authenticate_user

  # if current_user
  #      @user = current_user.user
  #      render "index.json.jbuilder"
  #    else
  #      render json: []
  #    end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      image: params[:image],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: false
    )
    
    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end 
end
