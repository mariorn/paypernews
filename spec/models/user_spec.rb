require 'rails_helper'

RSpec.describe User, type: :model do
  context 'two users with the same email' do
    before (:each) do
      @user1 = User.create({ name: 'test',
                             email: 'test@test.com',
                             password: '12345678',
                             password_confirmation: '12345678'
                              })

      @user2 = User.create({ name: 'test',
                               email: 'test@test.com',
                               password: '12345678',
                               password_confirmation: '12345678' })
    end

    it 'it should save just one of the users' do
      users = User.count
      expect(users).to be(1)
    end

    it "returns the name of user1" do
      expect(@user1.name).to eq("test")
    end

  end

  context 'two users with different email' do
    before (:each) do
      @user1 = User.create({ name: 'test',
                             email: 'test1@test.com',
                             password: '12345678',
                             password_confirmation: '12345678'  })

      @user2 = User.create({ name: 'test',
                               email: 'test2@test.com',
                               password: '12345678',
                               password_confirmation: '12345678' })
    end

    it 'it should save both of them' do
      users = User.count
      expect(users).to be(2)
    end

    it "returns the names of users" do
      expect(@user1.name).to eq(@user2.name)
    end

  end
end
