class Post < ActiveRecord::Base

  validates :header, presence: true
  validates :content, presence: true
end
