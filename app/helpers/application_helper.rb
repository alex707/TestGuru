module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "http://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash(key)
    case key
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    when 'success'
      'alert-success'
    else
      key.to_s
    end
  end

  def show_name
    current_user.last_name.presence || current_user.email
  end
end
