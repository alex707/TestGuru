class BadgeCheckerService
  def self.check(survey)
    Badge.all.select do |badge|
      key = JSON.parse(badge.param).keys.first
      val = JSON.parse(badge.param).values.first.to_i
      badge if send(key + ??, survey, val)
    end
  end

  def self.award(survey)
    survey.user.badges << self.check(survey)
  end

  private

  def self.category?(survey, val)
    return false if val != survey.test.category.id

    tests = Test.where(category: val)
    completed = survey.user.surveys.successed.where(test: tests)
    tests.count <= completed.count
  end

  def self.count?(survey, val)
    surveys = Survey.where(user: survey.user, test: survey.test)
    surveys.count == val && surveys.first.success?
  end

  def self.level?(survey, val)
    return false if val != survey.test.level

    tests = Test.where(level: val)
    completed = survey.user.surveys.successed.where(test: tests)
    tests.count <= completed.count
  end
end
