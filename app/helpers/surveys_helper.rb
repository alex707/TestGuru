module SurveysHelper
  def color(survey)
    survey.pass? ? 'green' : 'red'
  end

  def complete(survey)
    if survey.pass?
      t('surveys.show.result.success')
    else
      t('surveys.show.result.fail')
    end
  end
end
