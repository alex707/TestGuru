module BadgeChecker
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def check(survey)
      badges = []
      Badge.all.each do |badge|
        case badge.condition
        when 0
          badges << badge if send(:category, survey, badge)
        when 1
          badges << badge if send(:count, survey)
        when 2
          badges << badge if send(:level, survey, badge)
        end
      end

      badges
    end

    def category(survey, badge)
      res = false
      if badge.category_id == survey.test.category.id
        tests = Test.where(category: badge.category_id).pluck(:id)
        completed = Survey.completed(survey.user, tests).pluck(:test_id).uniq
        res = true if tests & completed == tests
      end
      res
    end

    def count(survey)
      Survey.completed(survey.user, survey.test).count == 1 ? true : false
    end

    def level(survey, badge)
      res = false
      if badge.level == survey.test.level
        tests = Test.where(level: badge.level).pluck(:id)
        completed = Survey.completed(survey.user, tests).pluck(:test_id).uniq
        res = true if tests & completed == tests
      end
      res
    end
  end
end
