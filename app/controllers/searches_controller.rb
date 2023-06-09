class SearchesController < ApplicationController
  before_action :authenticate_user!

 def search
  	@model = params[:model]
    @how = params[:how]

    if @model == "user"
      @users = User.search(params[:search], @model, @how)
    else
      @books = Book.search(params[:search], @model, @how)
    end
  end
end

