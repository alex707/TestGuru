module ApplicationHelper
  def current_year
    Time.current
  end

  def github_url(author, repo)
    link_to author, "http://github.com/#{repo}", target: '_blank'
  end
end
