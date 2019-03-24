module Services
  class ResultObject

    attr_reader :url

    def initialize(user, question, url, content)
      @user = user
      @question = question
      @url = url
      @content = content
    end

    def success?
      url.present? ? true : false
    end

    def to_hash
      {
        user: @user,
        question: @question,
        url: @url,
        content: @content
      }
    end
  end
end
