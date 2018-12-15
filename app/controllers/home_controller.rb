class HomeController < ApplicationController
  def show
    @questions = Question
                 .joins(:user_questions)
                 .where(user_questions: { user_id: current_user.id })
                 .order(updated_at: :desc)

    redirect_to questions_path if @questions.none?
  end
end