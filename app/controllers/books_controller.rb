class BooksController < ApplicationController
    before_action :authenticate_user!

    def new 
        @book = Book.new
    end 
    
    def create
        @user_id = current_user.id
        @user = User.find_by(id: @user_id)
        @book_all = Book.all
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@book)
        else
            flash[:notice] = "New post create error."
            render 'books/index'
        end 
    end 
    
    def show
        @user_id = current_user.id
        @user = User.find_by(id: @user_id)
        @book = Book.new
        @book_id = Book.find(params[:id])
        @book_user = User.find(@book_id.user_id)
    end 
    
    def index
        @user_id = current_user.id
        @user = User.find_by(id: @user_id)
        @book = Book.new
        @book_all = Book.all
        @user_all = User.all
    end 
    
    def edit
        @book = Book.new
        @book_id = Book.find(params[:id])
        if @book_id.user_id == current_user.id
            render "books/edit"
        else
            redirect_to books_path
        end
    end 
    
    def update
        @book = Book.new
        @book_id = Book.find(params[:id])
        if @book_id.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(@book_id)
        else
            flash[:notice] = "Post update error."
            render 'books/edit'
        end 
    end 
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end 
 
    private
    
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end 
end
