class AnswersController < ApplicationController
  
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer added successfully! Might not be right but at least it's there."
      redirect_to :back
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.upvote
    @answer.update
    redirect_to question_path(@question)
  end

private
  def answer_params
    params.require(:answer).permit(:body, :votes)
  end

end
