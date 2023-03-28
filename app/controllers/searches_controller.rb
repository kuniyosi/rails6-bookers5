class SearchesController < ApplicationController
  before_action :authenticate_user!

 def search
   @range = params[:range]

   if @range == "User"
     @users = User.looks(params[:search], params[:word])
     redirect_to result_path
   else
     @books = Book.looks(params[:search], params[:word])
     redirect_to result_path
   end
 end
 def result
 end
end

