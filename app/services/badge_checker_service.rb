class BadgeCheckerService
  def initialize(survey)
    @survey = survey
  end

  def check
    return [] unless @survey.pass?

    Badge.all.select do |badge|
      badge.rule == 'count' ? send(badge.rule + '?') : send(badge.rule + '?', badge.param)
    end
  end

  def award
    @survey.user.badges << self.check
  end

  private

  def category?(category_id)
    return false if category_id != @survey.test.category_id

    tests = Test.where(category: category_id)
    completed = @survey.user.surveys.passed.where(test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end

  def count?
    @surveys = Survey.where(user: @survey.user, test: @survey.test)
    @surveys.count == 1 && @surveys.first.pass?
  end

  def level?(level)
    return false if level != @survey.test.level

    tests = Test.where(level: level)
    completed = @survey.user.surveys.passed.where(test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end
end
