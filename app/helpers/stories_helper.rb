module StoriesHelper
  def has_all_permissions?
    user_signed_in? && current_user.id == @story.user_id
  end
end
