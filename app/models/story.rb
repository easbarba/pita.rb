class Story < ApplicationRecord
  belongs_to :user
  validates :title, :body, :user, presence: true

  scope :downroad, -> { order("created_at DESC") }
  scope :uproad, -> { order("created_at ASC") }
  scope :user, ->(id) { where(["user_id = ?", id]) }

  def published?
    published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a?(User)

    user == owner
  end
end
