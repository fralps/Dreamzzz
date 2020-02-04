class Lucid < ApplicationRecord
	
	# Validations
	 validates :title, presence: true, length: { minimum: 5 }
	 validates :date, presence: true
	 validates :description, presence: true, length: { minimum: 20 }
	 validates :emotion, presence: true, length: { minimum: 2 }
	 validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date > Date.today
      errors.add(:date, ": vous ne pouvez pas rêver dans le futur... 🤔")
    end
  end    

	 # Relations
	 belongs_to :user
end
