module SurveysHelper
  def color(survey)
    survey.pass? ? 'green' : 'red'
  end

  def complete(survey)
    if survey.pass?
      'Your testing is succesfull!'
    else
      "It's a bad result. Try again next time."
    end
  end
end
