# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # --------- Validations test ------------
  context 'validations' do
    describe 'validations' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      puts 'All validations tests for User model OK 👍'.green
    end
  end

  # ------------ Association tests -------------
  context 'associations' do
    describe 'associations' do
      # it { should have_many(:model_name) }
      # it { should have_many(:model_name) }
      # puts 'All associations tests for User model OK 👍'.green
    end
  end
end
