class Lucid < ApplicationRecord
	
	# Validations
	 validates :title, presence: true, length: { minimum: 5 }
	 validates :date, presence: true
	 validates :description, presence: true, length: { minimum: 20 }
	 validates :emotion, presence: true, length: { minimum: 2 }

	 # Relations
	 belongs_to :user
end
