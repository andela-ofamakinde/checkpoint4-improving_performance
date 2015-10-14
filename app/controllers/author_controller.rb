class AuthorController < ApplicationController

  def index
    @authors = Author.includes(:articles).all.paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
      format.js
    end
  end
end
