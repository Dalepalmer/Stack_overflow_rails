class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @haiku = Haiku.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Question added successfully!"
          redirect_to root_path
        end
      format.js
    end
  else
    flash[:alert] = "There was an issue saving your question"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

    def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully edited!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.destroy(params[:id])
      respond_to do |format|
        format.html do
          flash[:notice] = "question deleted"
          redirect_to root_path
        end
        format.js
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
