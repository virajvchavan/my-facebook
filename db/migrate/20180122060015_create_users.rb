class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :email
      t.string :password
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
