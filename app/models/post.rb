class Post < ApplicationRecord

	# Validations
	validates :title, presence: true, length: { minimum: 5 }
	validates :introduction, presence: true
	validates :first_paragraph, presence: true
	validates :second_paragraph, presence: true
	validates :image_url, presence: true

	# Relations
	has_many :comments
	has_many :likes
	belongs_to :user
end
