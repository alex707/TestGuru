module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "<a target=\"_blank\" href=\"http://github.com/#{repo}\">#{author}</a>".html_safe
  end
end
