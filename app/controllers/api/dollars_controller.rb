class Api::DollarsController < ApplicationController

  def index
    @dollars = Dollar.all
    render 'index.json.jbuilder'
  end 

  def show
    dollar_id = params[:id]
    @dollar = Dollar.find(dollar_id)
    render 'show.json.jbuilder'
  end 

  def update
    #for testing set current_user to true
    current_user = true 

    if current_user
      dollar_id = params[:id]
      @dollar = Dollar.find(dollar_id)

       @dollar.serial_num = params[:serial_num] || @ark.serial_num
       
       if @dollar.save
         render 'show.json.jbuilder'
       else
         render json: {errors: @dollar.errors.full_messages}, status: :unprocessable_entity
       end
    else
      render json: {}, status: :unauthorized 
    end
  end
end
