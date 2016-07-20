class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    !!user && user.authenticate(password)
  end
end
