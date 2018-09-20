class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new, :show, :edit, :update, :destroy, :create]
  before_action :correct_user, only:[:edit, :update]

  def top
  end

  def about
  end

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
    @bookf = Book.find(params[:id])
    @book = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "Book was successfully created."
    	redirect_to book_path(@book)
    else
      @books = Book.all
      render "index"
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    	redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
       flash[:notice] = "Book was successfully destroyed."
  	   redirect_to books_path
     else
      render "show"
    end
  end

  def correct_user
    @correct = current_user.books.find_by(id: params[:id])
    unless @correct
      redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:Title, :Opinion, :user_id)
  end
end
