class GitHubClientFaraday

  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    result = @http_client.post('gists', params) do |faraday|
      faraday.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      faraday.headers['Content-Type'] = 'application/json'
      faraday.body = params.to_json
    end

    result ? JSON.parse(result.body)['html_url'] : nil
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
