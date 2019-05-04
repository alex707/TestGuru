module SurveysHelper
  def color(survey)
    survey.pass? && survey.success? ? 'green' : 'red'
  end

  def complete(survey)
    if survey.pass? && survey.success?
      t('surveys.show.result.success')
    else
      t('surveys.show.result.fail')
    end
  end
end
