class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    # relationship = current_user.relationships.new(followed_id: user.id)
    # relationship.save
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    # relationship = current_user.relationships.find_by(followed_id: user.id)
    # relationship.destroy
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
