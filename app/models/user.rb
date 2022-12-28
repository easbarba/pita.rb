class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :stories, -> { order 'published_at DESC, title ASC' }, dependent: :nullify
end
