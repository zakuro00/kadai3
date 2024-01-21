class BooksController < ApplicationController
  
  def new
    @book = Book.new  
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    @book.user_id = current_user.id
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
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to 'books_path'  # 投稿一覧画面へリダイレクト  
  end

  
  private
 
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end

