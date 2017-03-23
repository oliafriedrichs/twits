class RelationshipsController < ApplicationController
  def create
   @relationship = current_user.relationships.build(friend_id: params[:friend_id])
   @friend = User.find(params[:friend_id])

    if @relationship.save
      flash[:notice] = "You're now following #{@friend.username}."
      redirect_to profile_path(@friend.id)
    else
      flash[:notice] = "Unable to follow #{@friend.username}."
      redirect_to profile_path(@friend.id)
    end
  end

private
  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)
  end

end
