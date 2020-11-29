class FriendshipsController < ApplicationController

   before_action :authenticate_user
   #protect_from_forgery :except => [:destroy]

  def index

  end

  def requested
  end

  def thanks
  end

  def accept
  	@friendship = Friendship.find(params[:id])
  	@friendship.confirmed = true
  	if @friendship.save
  	  flash[:notice]= "You got a new friend!"
      redirect_to("/friendships/#{@current_user.id}/index")
    else
      flash[:notice]= "something went wrong..try again!"
      render("posts")
    end
  end

  

  def send_request
  	@friendship = Friendship.new(user_id: @current_user.id ,receiver_id: params[:id], confirmed: false)
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
  	@friendship = Friendship.find_by(receiver_id: @current_user.id ,user_id: params[:id]) if @friendship.nil?
    @friendship.destroy
    flash[:notice]= "Deleted successfully!"
    redirect_to("/users/#{params[:id]}")
  end

end
