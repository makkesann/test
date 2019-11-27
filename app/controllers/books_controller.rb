class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /books
  # GET /books.json
  def index
    @books = @user.books
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = @user.books.find(params[:id])
  end

  # GET /books/new
  def new
    @book = @user.books.build
    @books = Book.all
  end

  # GET /books/1/edit
  def edit
    @book = @user.books.find(params[:id])
  end
  
  def publish
    @books_publish = @user.books.where(publish: true)
  end
  
  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user_id = params[:user_id]
    respond_to do |format|
      if @book.save
        format.html { redirect_to user_book_path(@user, @book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = @user.books.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to user_book_path(@user, @book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to user_books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :isbn, :description, :price, :user_id, :publish)
    end
end
