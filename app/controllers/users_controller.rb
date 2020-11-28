class UsersController < ApplicationController

  

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit_name
    @user = User.find_by(id: params[:id])
  end

  def update_name
    @user = User.find_by(id: params[:id])
    if params[:user_name].present? 
      @user.name = params[:user_name]
      if @user.save
        flash[:notice]= "Updated successfully!"          
        redirect_to("/users/#{@user.id}")
      else
        show_error("Something went wrong..try again!","users/#{@user.id}/edit_name")
      end
    end
  end

end