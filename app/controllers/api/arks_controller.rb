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
    if current_user
    
     @ark = Ark.new do |a|
  a.description = params[:description]
  a.user_id = current_user.id
  a.image = params[:image]
  a.serial_num = params[:serial_num]
  a.location = params[:location]
  a.completed = params[:completed]
  
end
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
      @ark.serial_num = params[:serial_num] || @ark.serial_num
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
