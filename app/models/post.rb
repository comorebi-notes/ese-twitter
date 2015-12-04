class Post < ActiveRecord::Base
  belongs_to :user
  # validates :subject, presence: true
  validates :text,
  presence: true,
  length: { maximum: 140 }
  # validates :name,    presence: true

  # has_secure_password
end
