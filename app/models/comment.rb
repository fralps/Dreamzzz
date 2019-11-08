class Comment < ApplicationRecord

	# Validations
	validates :content, presence: true

	# Relations
	belongs_to :user
	belongs_to :post
end
