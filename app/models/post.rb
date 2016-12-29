class Post < ApplicationRecord
	scope :recent, -> { order("created_at DESC")}

	belongs_to :user
	belongs_to :group

	validates :content, presence: true
end
