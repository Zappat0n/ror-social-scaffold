class FriendshipsController < ApplicationController
    include FriendshipsHelper
    def new
        @friendship = Friendship.new
    end
    def create
        @friendship = Friendship.new(friendship_params)
        if @friendship.save
            redirect_to users_path, notice: "Friend requested"

        else
            notice: "Error requesting friend"
    end
    end
end
