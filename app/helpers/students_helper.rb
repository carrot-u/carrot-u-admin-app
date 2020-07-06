module StudentsHelper
  def answer_value(question_key)
    @answers.find { |answer| answer.question_key == question_key }&.text
  end

  def goal_options
    goals = [
      "-- Select a goal --",
      "Move into a full time engineering role at Instacart",
      "Use new skills in your current role",
      "Use new skills to pursue another job outside of Instacart",
      "Other"
    ]
    options_for_select(goals, disabled: goals.first)
  end
end
