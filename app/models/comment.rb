class Comment < ApplicationRecord

	# Validations
	validates :content, presence: true, length: { minimum: 5 }

	# Relations
	belongs_to :user
	belongs_to :post
end
