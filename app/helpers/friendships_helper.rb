module FriendshipsHelper
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
