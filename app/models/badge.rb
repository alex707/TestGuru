class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  def self.check survey
    badges = []

    if survey.pass?
      cat = survey.test.category

      if cat.title == 'Backend'
        tests = Test.where(category: cat).pluck(:id)
        completed = Survey.where(user: survey.user, test: tests).select{|s| s.pass?}.map(&:test_id)
        badges << Badge.find_by(condition: 0) if tests & completed == tests
      end

      if Survey.where(user: survey.user, test: survey.test).count == 1
        badges << Badge.find_by(condition: 1)
      end

      level = survey.test.level
      tests = Test.where(level: level).pluck(:id)
      completed = Survey.where(user: survey.user, test: tests).select{|s| s.pass?}.map(&:test_id)
      badges << Badge.find_by(condition: 2) if tests & completed == tests
    end

    badges
  end
end
