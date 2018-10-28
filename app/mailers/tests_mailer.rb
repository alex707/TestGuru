class TestsMailer < ApplicationMailer

  def completed_test(survey)
    @user = survey.user
    @test = survey.test

    mail to: @user.email
  end

end
