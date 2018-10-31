module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "http://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    mapping = {
      'error' => 'alert-danger',
      'alert' => 'alert-warning',
      'notice' => 'alert-info',
      'success' => 'alert-success'
    }
    "alert #{mapping[key]} alert-dismissable"
  end

  def show_name
    current_user.last_name.presence || current_user.email
  end
end
