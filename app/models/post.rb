class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, :content, presence: true

  def excerpt
    self.content.slice(0..400) + '...'
  end

end