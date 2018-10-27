module SurveysHelper
  def color(survey)
    survey.pass? ? 'green' : 'red'
  end

  def complete(survey)
    if survey.pass?
      t('.success')
    else
      t('.fail')
    end
  end
end
