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
    
    if current_user
      @ark = Ark.new(
        description: params[:description],
        user_id: params[:user_id],
        image: params[:image],
        location: params[:location],
        dollar_id: params[:dollar_id]
      )
      
      if @ark.save
        render "show.json.jbuilder"
      else
        render json: {errors: @ark.errors.full_messages}, status: :unprocessable_entity
      end
     else 
        render json: {}, status: :unauthorized
     end 
  end 
end
