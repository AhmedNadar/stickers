class Comment < ActiveRecord::Base

  # associations
  belongs_to :article
  belongs_to :user

  # validations
  validates_presence_of :body
end
