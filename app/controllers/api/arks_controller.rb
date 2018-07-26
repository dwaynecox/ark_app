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
    #issue with admin code for method = false error, removed shouldn't need to be admin to create ark
    current_user = true;

    @dollar = Dollar.create(
      serial_num: rand.to_s[2..11])
    
    if current_user
      @ark = Ark.new(
        description: params[:description],
        user_id: current_user,
        image: params[:image],
        location: params[:location],
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
    #for testing set current_user to true
    current_user = true 

    if current_user
      ark_id = params[:id]
      @ark = Ark.find(ark_id)

      @ark.description = params[:description] || @ark.description
      # @ark.user_id = params[:user_id] || @ark.user_id
      @ark.image = params[:image] || @ark.image
       @ark.location = params[:location] || @ark.location
      # @ark.dollar_id = params[:dollar_id] || @ark.dollar_id
       
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
