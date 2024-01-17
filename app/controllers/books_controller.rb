class BooksController < ApplicationController
  
  def new
    @book = Book.new  
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    
    flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert]="error"
      render :edit 
    end
    
    
    
  end
  
  def index
    @books = Book.all 
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  private
 
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

