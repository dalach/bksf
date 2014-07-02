class BooksController < ApplicationController
  before_filter :verify_is_admin, only: [:new, :edit, :update, :destroy]
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

  def add_to_bookshelf
    @book = Book.find(params[:book_id])
    if BookOnBookshelf.create(book_id: @book.id, bookshelf_id: current_user.bookshelf.id)
      flash[:notice] = 'Book added.'
      redirect_to :back
    else
      flash[:error] = 'Book NOT added'
      redirect_to :back
    end
  end

  def remove_from_bookshelf
    @book = Book.find(params[:book_id])
    @book.book_on_bookshelf_ids.each do |index|
      if BookOnBookshelf.all[index].bookshelf_id == current_user.bookshelf.id
        BookOnBookshelf.all[index].destroy!
        flash[:notice] = 'Book removed.'
        redirect_to root_path

      else
        flash[:error] = 'Book NOT removed'
        redirect_to :back
      end
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :cover)
    end

  private
    def verify_is_admin
      (current_user.nil?) ? redirect_to(books_path) : (redirect_to(books_path) unless current_user.admin?)
    end

end
