class UserQuestionsController < ApplicationController
  
  def index
    @user_id = params[:user_id]
    @questions = Question.all
    @user_questions = UserQuestion.find_all_by_user_id @user_id
  end

  def create
    user_id = params[:user_id]
    
    existing_user_questions = UserQuestion.find_all_by_user_id user_id
    answers = params[:answers]
    
    answers.map do |k,v|
      existing_user_question = existing_user_questions == nil ? nil : existing_user_questions.select{|q| k.to_i == q.question_id}
      if existing_user_question == nil || existing_user_question.empty?
        UserQuestion.create!(:user_id => user_id, :question_id => k, :answer => v)
      else
        user_question = existing_user_question[0]
        user_question.update_attribute(:answer, v)
      end
    end
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points
    end
    redirect_to user_path(user_id)
  end
  
end