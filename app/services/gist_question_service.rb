class GistQuestionService
  def initialize(survey, client: nil)
    @question = survey.current_question
    @user = survey.user
    @test = @question.test
    @client = client || GitHubClientOctokit.new
  end

  def call
    url = @client.create_gist(gist_params)
    if !url.nil? && !url.empty?
      Gist.create!({
        user: @user,
        question: @question,
        url: url,
        content: gist_params.to_json
      })

      url
    else
      nil
    end
  end

  private

  def gist_params
    {
      description: I18n.t('services.about', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
