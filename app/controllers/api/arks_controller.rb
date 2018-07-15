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
end
