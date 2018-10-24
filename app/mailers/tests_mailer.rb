class TestsMailer < ApplicationMailer

  def completed_test(survey)
    @user = survey.user
    @test = survey.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

end
