class HomesController < ApplicationController
  
  def edit
    @list = Book.find(params[:id])
  end
  
  def about
  
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
