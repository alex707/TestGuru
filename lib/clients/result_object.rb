class ResultObject

  attr_reader :url, :content

  def initialize(url, content)
    @url = url
    @content = content
  end

  def success?
    url.present?
  end
end
