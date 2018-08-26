class Api::ArksController < ApplicationController

  def index
    @arks = Ark.all
    render 'index.json.jbuilder'
  end 

  def show
    ark_id = params[:id]
    @ark = Ark.find(ark_id)
    render 'show.json.jbuilder'
  end 

  def create
    @dollar = Dollar.create(
       serial_num: rand.to_s[2..11])
     
   if current_user
     @ark = Ark.new(
       description: params[:description],
       user_id: current_user.id,
       image: params[:image],
       location: params[:location],
       completed: params[:completed],
       dollar_id: @dollar.id)
     
     if @ark.save
       render "show.json.jbuilder"
     else
       render json: {errors: @ark.errors.full_messages}, status: :unprocessable_entity
     end
   else 
     render json: {}, status: :unauthorized
   end 
 end 

  def update
    if current_user
      ark_id = params[:id]
      @ark = Ark.find(ark_id)

      @ark.description = params[:description] || @ark.description
      @ark.image = params[:image] || @ark.image
      @ark.completed = params[:completed] || @ark.completed
      @ark.location = params[:location] || @ark.location
     
      if @ark.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @ark.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized 
    end
  end
end
