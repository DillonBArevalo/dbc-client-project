class FilmsController < ApplicationController
  def index
  	# pagination
    @allfilms = Film.order(:title).page params[:page]

    # searching
    if params[:search] && params[:search].length > 0
      @films = Film.search(params[:search]).order("title ASC").page
      @allfilms = nil
    else
      @films = Film.order(:title).page params[:page]
    end
  end

  def show
    authenticate_user!
    @film = Film.find(params[:id])
  end

end