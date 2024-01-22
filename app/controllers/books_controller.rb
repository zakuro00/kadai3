class BooksController < ApplicationController
  
  def new
    @book = Book.new  
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    
      flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
       flash.now[:alert]="error"
       @books = Book.all
       @user = current_user
       render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
    
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト  
  end

  
  private
 
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end

