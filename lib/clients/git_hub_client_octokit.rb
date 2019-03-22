class GitHubClientOctokit
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(user, question, gist_params)
    result = @http_client.create_gist(gist_params)

    Gist.create!({
      user: user,
      question: question,
      url: result ? result[:html_url] : nil,
      content: gist_params.to_json
    }).url
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end
end
