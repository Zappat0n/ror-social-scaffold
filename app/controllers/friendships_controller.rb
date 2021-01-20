class FriendshipsController < ApplicationController
    include FriendshipsHelper
    def new
        @friendship = Friendship.new
    end

    def create
        @friendship = current_user.friendships.build(friendship_params)
        if @friendship.save
            redirect_to users_path, notice: "Friend requested"
        else
            redirect_to users_path, notice: @friendship.errors.full_messages
        end
    end
end
