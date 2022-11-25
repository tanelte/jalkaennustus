class UserQuestionsController < ApplicationController
  
  def index
    @tournament_id = params[:tournament_id]
    @user = User.find_by_id params[:user_id]
    @questions = Question.order(:id).all
    @user_questions = UserQuestion.where(:user_id => @user.id, :tournament_id => @tournament_id)
  end

  def create
    tournament_id = params[:tournament_id]
    user_id = params[:user_id]    
    user = User.find_by_id user_id

    if user.name != 'tegelikud tulemused'
      raise "Mine pekki!"
    end

    
    existing_user_questions = UserQuestion.where(:user_id => user_id, :tournament_id => tournament_id)
    answers = params[:answers]
    
    answers.to_unsafe_h.map do |k,v|
      existing_user_question = existing_user_questions == nil ? nil : existing_user_questions.select{|q| k.to_i == q.question_id}
      if existing_user_question == nil || existing_user_question.empty?
        UserQuestion.create!(:user_id => user_id, :question_id => k, :answer => v, :tournament_id => tournament_id)
      else
        user_question = existing_user_question[0]
        user_question.update_attribute(:answer, v)
      end
    end
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id, current_group
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
end