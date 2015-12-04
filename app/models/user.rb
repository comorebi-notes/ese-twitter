class User < ActiveRecord::Base
  has_many :posts
  # self.primary_key = "name"

  def self.colors
    [["red",    "red"],
    [ "blue",   "blue"],
    [ "green",  "green"],
    [ "purple", "purple"],
    [ "brown",  "brown"],
    [ "gray",   "gray"],
    [ "lime",   "lime"]]
  end

  validates :name, presence: true
  has_secure_password
end
