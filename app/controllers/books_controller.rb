class BooksController < ApplicationController
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      #フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
       flash.now[:alert] = "Failed!"
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new #newをindex画面に
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      #フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
       flash.now[:alert] = "Failed!"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]) #データ（レコード）を一件取得
    @book.destroy #データを削除
    redirect_to '/books' #投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータは一番最後
  def book_params
    params.require(:book).permit(:title, :body)
  end
end