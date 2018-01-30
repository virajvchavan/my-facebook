require "rails_helper"

RSpec.describe User do
  context "User validations" do
    let(:user) { build :user }
    it "is a valid user" do
      expect(user.valid?).to eq(true)
    end

    context "Email validation" do
      let(:user) { build :user, email: 'hp.com' }
      it "has wrong email format" do
        expect(user.valid?).to eq(false)
        expect(user.errors['email']).to eq(['is invalid'])
      end

      let(:user1) { build :user, email: 'h@p.com' }
      let(:user2) { build :user, email: 'h@p.com' }
      it "has unique email" do
        user1.save
        expect(user2.valid?).to eq(false)
        expect(user2.errors['email']).to eq(['has already been taken'])
      end
    end

    let(:user3) { build :user, password: 'ab' }
    it "has short password" do
      expect(user3.valid?).to eq(false)
      expect(user3.errors['password']).to eq(['is too short (minimum is 6 characters)'])
    end

    let(:user4) { build :user, password: 'abcdefghijklmnopqrstuvwxyztumbhikaho' }
    it "has long password" do
      expect(user4.valid?).to eq(false)
      expect(user4.errors['password']).to eq(['is too long (maximum is 32 characters)'])
    end
  end
end
