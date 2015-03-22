class Article < ActiveRecord::Base
  acts_as_votable

  # associations
  belongs_to :user
  has_many :comments

  # validation
  validates_presence_of :title, :content, :link

  # paperclip
  has_attached_file :image, styles:{ large: "600x600>",
                                    medium: "300x300>",
                                     small: "150x150#" },
   url: "/assets/:class/:id/:style.:extension",
   path: ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g/]
  validates_attachment_size :image, less_than: 3.megabytes
end
