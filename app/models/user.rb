# frozen_string_literal: true

class User < ApplicationRecord
  # after_create :welcome_send
  
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: ' : veuillez utiliser une adresse email valide' }

  # Relations
  has_many :dreams
  has_many :nightmares
  has_many :lucids
  has_many :likes

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
