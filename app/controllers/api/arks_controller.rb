class Api::ArksController < ApplicationController

  def index

    @arks = Ark.all

    render 'index.json.jbuilder'
  end 
end
