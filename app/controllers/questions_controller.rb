class QuestionsController < ApplicationController
  before_filter :logged_in_using_omniauth?
  before_action :set_current_user
  def show
    @question = Question.find(params[:id])
    @book = @question.book
  end
end
