class UsersController < ApplicationController
  
  def index
   
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
     flash[:notice] = "Welcome! You have signed up successfully."
  end
  
  def edit
  end
end
