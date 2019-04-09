class GistQuestionService
  def initialize(survey, client: default_client)
    @question = survey.current_question
    @user = survey.user
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.about', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    ::GitHubClientOctokit.new
  end
end
