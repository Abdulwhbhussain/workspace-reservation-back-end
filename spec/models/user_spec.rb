require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has to be present' do
      user = User.create(username: nil)
      expect(user).not_to be_valid
    end

    it 'has to be unique' do
      User.create(username: 'test')
      user = User.new(username: 'test')
      expect(user).not_to be_valid
    end

    it 'cannot be blank' do
      user = User.create(username: '')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many  posts' do
      user = User.reflect_on_association(:reservations)
      expect(user.macro).to eq(:has_many)
    end
  end
end
