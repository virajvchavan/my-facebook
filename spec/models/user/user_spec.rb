require "rails_helper"

RSpec.describe User do
  context "User validations" do
    it "is a valid user" do
      user = User.new(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'somepassword')
      expect(user.valid?).to eq(true)
    end

    context "Email validation" do
      it "has wrong email format" do
        user = User.new(name: 'Harry Potter', email: 'hp.com', gender: 'male', password: 'somepassword')
        expect(user.valid?).to eq(false)
        expect(user.errors['email']).to eq(['is invalid'])
      end

      it "has unique email" do
        User.create(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'somepassword')
        user = User.new(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'somepassword')
        expect(user.valid?).to eq(false)
        expect(user.errors['email']).to eq(['has already been taken'])
      end
    end

    it "has small password" do
      user = User.new(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'a')
      expect(user.valid?).to eq(false)
      expect(user.errors['password']).to eq(['is too short (minimum is 6 characters)'])
    end

    it "has big password" do
      user = User.new(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'abcdefghijklmnopqrstuvwxyztumbhikaho')
      expect(user.valid?).to eq(false)
      expect(user.errors['password']).to eq(['is too long (maximum is 32 characters)'])
    end
  end
end
