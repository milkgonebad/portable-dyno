class UsersController < ApplicationController
  before_filter :ensure_admin
  
  def index
    @users = User.all
  end

  def new
    #TODO
  end
  
  def edit
    #TODO
  end

  def update
    #TODO
  end

  def destroy
    user = User.find params[:id]
    unless current_user == user
      user.destroy!
    else
      flash[:error] = 'You cannot delete yourself.  That would be bad.'
      redirect_to :action => :index
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
