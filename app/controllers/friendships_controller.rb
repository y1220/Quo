class FriendshipsController < ApplicationController

   before_action :authenticate_user
   #protect_from_forgery :except => [:destroy]

  def index

  end

  def requested
  end

  def thanks
  end

  

  def send_request
  	@friendship = Friendship.new(user_id: @current_user.id ,receiver_id: params[:id], confirmed: true)
    if @friendship.save
      redirect_to("/friendships/thanks")
    else
      flash[:notice]= "something went wrong..try again!"
      render("posts")
    end
  end
 

  def destroy
  		#byebug
  	@friendship = Friendship.find_by(user_id: @current_user.id ,receiver_id: params[:id])
    @friendship.destroy
    flash[:notice]= "Deleted successfully!"
    redirect_to("/users/#{params[:id]}")
  end

end
