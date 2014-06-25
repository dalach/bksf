class BookshelvesController < ApplicationController

  before_action :set_bookshelf, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @bookshelf = Bookshelf.new
  end

  def show
  end

  def edit
  end

  def create
    @bookshelf = Bookshelf.new(bookshelf_params)
    @bookshelf.user_id = current_user.id

    if @bookshelf.save
      flash[:notice] = 'Bookshelf successfully created'
      redirect_to @bookshelf
    else
      flash[:error] = 'Bookshelf not created'
      render :new
    end
  end

  def update
    if @bookshelf.update(bookshelf_params)
      flash[:notice] = 'bookshelf was successfully updated.'
      redirect_to @bookshelf
    else
     render :new
    end
  end

  def destroy
    @bookshelf.destroy
    flash[:notice] = "Bookshelf destroyed"
  end

  private
  def set_bookshelf
    @bookshelf = Bookshelf.find(params[:id])
  end

  def bookshelf_params
    params.require(:bookshelf).permit(:name, :user_id)
  end
end
