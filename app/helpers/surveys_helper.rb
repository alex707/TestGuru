module SurveysHelper
  def color(survey)
    survey.success? ? 'green' : 'red'
  end

  def complete(survey)
    if survey.success?
      t('surveys.show.result.success')
    else
      t('surveys.show.result.fail')
    end
  end
end
