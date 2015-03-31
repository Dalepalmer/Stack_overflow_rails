class Answer < ActiveRecord::Base
  belongs_to :question
  validates :body, :presence => true
  validates :question_id, :presence => true
  default_scope -> { order(:votes => :desc)}


  def upvote
    self.votes += 1
  end
end
