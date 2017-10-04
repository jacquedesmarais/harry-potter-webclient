class CharactersController < ApplicationController

  def index
    @characters = Unirest.get("#{ ENV['HOST_NAME'] }/api/v2/characters.json").body
  end

  def new
    
  end

  def create
    @character = Unirest.post(
                              "#{ ENV['HOST_NAME'] }/api/v2/characters",
                              headers:{ "Accept" => "application/json" }, 
                              parameters:{ 
                                          first_name: params[:first_name], 
                                          last_name: params[:last_name], 
                                          house: params[:house] }
                              ).body

    redirect_to "/characters/#{ @character['id'] }"
  end

  def show
    @character = Unirest.get("#{ ENV['HOST_NAME'] }/api/v2/characters/#{params[:id]}.json").body
  end

  def edit
    @character = Unirest.get("#{ ENV['HOST_NAME'] }/api/v2/characters/#{params[:id]}.json").body
  end

  def update
    @character = Unirest.patch(
                              "#{ ENV['HOST_NAME'] }/api/v2/employees/#{params[:id]}",
                              paramaters: {
                                          first_name: params[:first_name],
                                          last_name: params[:last_name],
                                          house: params[:house]
                                          }
                              ).body
    redirect_to "/characters/#{ @character['id'] }"
  end

  def destroy
    @character = Unirest.delete(
                                "#{ ENV['HOST_NAME'] }/api/v2/characters/#{params[:id]}.json",
                                headers:{ "Accept" => "application/json" }
                                )
    redirect_to "/characters"
  end

end
