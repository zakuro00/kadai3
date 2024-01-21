class UsersController < ApplicationController
  
  def index
    @books = Book.all
   
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
     flash[:notice] = "Welcome! You have signed up successfully."
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
