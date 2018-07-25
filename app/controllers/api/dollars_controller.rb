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
end
