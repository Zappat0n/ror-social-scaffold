class FriendshipsController < ApplicationController
  include FriendshipsHelper
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    if @friendship.save
      redirect_to users_path, notice: 'Friend requested'
    else
      redirect_to users_path, notice: @friendship.errors.full_messages
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.status = !@friendship.status
    if @friendship.save
      redirect_to current_user, notice: 'Invitation accepted'
    else
      redirect_to current_user, notice: 'Error accepting invitation'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      redirect_to current_user, notice: 'Invitation rejected'
    else
      redirect_to current_user, notice: 'Error accepting rejecting'
    end
  end
end
