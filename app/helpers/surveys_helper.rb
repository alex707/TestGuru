module SurveysHelper
  def color res
    if res >= 85
      'green'
    else
      'red'
    end
  end

  def complete res
    if res >= 85
      'Your testing is succesfull!'
    else
      "It's a bad result. Try again next time."
    end
  end
end
