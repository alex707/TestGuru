class BadgeCheckerService
  def initialize(survey)
    @survey = survey
  end

  def check
    return [] unless @survey.pass?

    Badge.all.select { |badge| send(badge.rule + '?', badge.param) }
  end

  def award
    @survey.user.badges << check
  end

  private

  def category?(category_id)
    return false if category_id != @survey.test.category_id

    tests = Test.where(category: category_id).pluck(:id)
    completed = @survey.user.surveys.passed.where(test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end

  def count?(_param)
    @surveys = Survey.where(user: @survey.user, test: @survey.test)
    @surveys.count == 1
  end

  def level?(level)
    return false if level != @survey.test.level

    tests = Test.where(level: level).pluck(:id)
    completed = @survey.user.surveys.passed.where(test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end
end
