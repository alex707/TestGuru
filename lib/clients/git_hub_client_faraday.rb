class GitHubClientFaraday

  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(gist_params)
    result = @http_client.post('gists', gist_params) do |faraday|
      faraday.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      faraday.headers['Content-Type'] = 'application/json'
      faraday.body = gist_params.to_json
    end

    ResultObject.new(
      result ? JSON.parse(result.body)['html_url'] : nil,
      gist_params.to_json
    )
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
