class Post < ApplicationRecord

	# Validations
	validates :title, presence: true, length: { minimum: 5 }
	validates :content, presence: true

	# Relations
	has_many :comments
	belongs_to :user


end
