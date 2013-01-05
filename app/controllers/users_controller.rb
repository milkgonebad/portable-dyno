class UsersController < ApplicationController
  before_filter :authenticate_user!, :ensure_admin
  
  def index
    @users = User.order('email')
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => 'User was successfully created.'
    else
      render :action => :new 
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'User was successfully updated.'
    else
      render :action => :edit 
    end
  end

  def destroy
    user = User.find params[:id]
    unless current_user == user
      user.destroy
      redirect_to users_path
    else
      redirect_to users_path, :notice => 'You cannot delete yourself.  That would be bad.'
    end
  end
  
  private
  
  def ensure_admin
    unless current_user.admin?
      flash[:error] = 'You are not authorized to edit users.'
      redirect_to admin_path
    end 
  end
  
end
