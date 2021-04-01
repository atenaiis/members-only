module PostsHelper
  def author_name(post)
    if user_signed_in?
      post.user.name
    else
      'Anonimous'
    end
  end

  def display_if_author(post)
    return 'd-none' unless user_signed_in? && current_user.id == post.user_id
  end
end
def navbar
  if user_signed_in?
    link_to('Edit profile', edit_user_registration_path, class: 'navbar-link strong') +
      link_to('Sign Out', destroy_user_session_path, method: :delete, class: 'nav-link glyphicon
     glyphicon-log-in text-white') +
      content_tag(:a, current_user.name, class: %w[nav-link disabled])
  else
    link_to('Sign In', user_session_path, class: 'nav-link active glyphicon glyphicon-log-in text-white') +
      link_to('Sign Up', new_user_registration_path, class: 'nav-link active glyphicon glyphicon-user text-white')
  end
end
