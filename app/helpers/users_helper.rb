module UsersHelper

  def get_karma
    current_user = User.find_by_remember_token(session[:remember_token])
    link_ids_created_by_current_user = Link.
                                    select(:id).
                                    where(:creator_id => current_user.id)

    id_string = link_ids_created_by_current_user.map do |link|
      link.id
    end

    karma = Upvote.where("link_id IN (?)", id_string).count
  end

end
