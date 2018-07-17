class Api::DollarsController < ApplicationController

  def index
    @dollars = Dollar.all
    render 'index.json.jbuilder'
  end 
end
