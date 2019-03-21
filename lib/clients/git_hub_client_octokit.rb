class GitHubClientOctokit
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    result = @http_client.create_gist(params)
    result ? result[:html_url] : nil
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end
end
