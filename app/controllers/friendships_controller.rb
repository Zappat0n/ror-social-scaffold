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
            flash[:notice] "Error requesting friend"
        end
    end
    end
end
