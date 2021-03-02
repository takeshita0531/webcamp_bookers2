class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = User.new
  end 
  
  def show
    @book = Book.new
    @user_new = User.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user)
  end
  
  def index
    @user_id = current_user.id
    @user = User.find_by(id: @user_id)
    @book = Book.new
    @user_all = User.all
  end 
  
  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
        render 'edit'
    else
        redirect_to user_path(current_user)
    end 
  end 
  
  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render "edit"
    end 
  end 
  
  def update
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      flash[:notice] = "User update error."
      render "edit"
    end
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
end
