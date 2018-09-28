module QuestionsHelper
  def question_header(action, test)
    if action == 'create'
      "Create New #{test.title} Question"
    elsif action == 'edit'
      "Edit #{test.title} Question"
    end
  end
end
