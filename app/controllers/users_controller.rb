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

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    render 'show.json.jbuilder'
  end

  def update
    #temp   # current_user = true

    if current_user || current_user.admin
      user_id = params[:id]
      @user = User.find(user_id)

      @user.first_name = params[:first_name] || @user.first_name
      @user.last_name = params[:last_name] || @user.last_name
      @user.email = params[:email] || @user.email
      @user.image = params[:image] || @user.image
       
      if @user.save
        render 'show.json.jbuilder'
       else
         render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized 
    end
  end

  def destroy  #not being called, using update to change the email in public/index.js file to softdelete + email
    if current_user || current_user.admin
      user_id = params[:id]
      @user = User.find(user_id)
      @user.destroy
      render json: {message: "user successfully destroyed"}
    else
      render json: {}, status: :unauthorized 
    end
  end

end
