module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "http://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash flash
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    elsif flash[:info]
      content_tag :p, flash[:info], class: 'flash info'
    end
  end
end
