class GitHubClientOctokit

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(gist_params)
    result = @http_client.create_gist(gist_params)

    ResultObject.new(
      result ? result[:html_url] : nil,
      gist_params.to_json
    )
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end
end
