class BooksController < ApplicationController
  
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      flash[:notice] = 'Book created!'
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to @book
    else
     render :new
    end
  end

  def destroy
    if @book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to books_path
    else
      redirect_to books_path, error: 'Book was NOT destroyed.'
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :cover)
    end
end