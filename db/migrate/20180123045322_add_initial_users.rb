class AddInitialUsers < ActiveRecord::Migration[5.1]
  def up
    5.times do |i|
      User.create(name: "User#{i}", email: "user#{i}@domail.com", gender: 'male')
    end
  end

  def down
    User.delete_all
  end
end
