class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1,1], message: "%{value} is not a valid vote."}

  after_save :update_vote

  private

  def update_vote
  	self.post.update_rank
  end
end
