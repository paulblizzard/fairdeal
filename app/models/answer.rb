class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :dealing

  after_initialize :init

  def init
      self.category  ||= 'unknown' 
  end
end
