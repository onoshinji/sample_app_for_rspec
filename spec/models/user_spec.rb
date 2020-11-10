require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'is invalid without email' do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["can't be blank"]
    end

    it 'is invalid less than password 3characters' do
      user_less_than_password = build(:user, password: "12")
      expect(user_less_than_password).to be_invalid
      expect(user_less_than_password.errors[:password]).to eq ["is too short (minimum is 3 characters)"]
    end

    it 'is invalid without email' do
      user_without_password_confirmation= build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["doesn't match Password", "can't be blank"]
    end

    it 'is invalid with a duplicate email' do
      user = create(:user)
      user_with_duplicated_email = build(:user, email: user.email)
      expect(user_with_duplicated_email).to be_invalid
      expect(user_with_duplicated_email.errors[:email]).to eq ["has already been taken"]
    end
  end
end
