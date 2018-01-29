require "rails_helper"

RSpec.describe User, :type => :model do
  context "" do
    it "valid user" do
      user = User.create(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'somepassword')
      expect(user.valid?).to eq(true)
    end

    it "wrong email format" do
      user = User.create(name: 'Harry Potter', email: 'hp.com', gender: 'male', password: 'somepassword')
      expect(user.valid?).to eq(false)
    end

    it "small password" do
      user = User.create(name: 'Harry Potter', email: 'h@p.com', gender: 'male', password: 'a')
      expect(user.valid?).to eq(false)
    end
  end
end
