# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  gender        :string
#  email         :string
#  password      :string
#  date_of_birth :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
  has_one :address
  has_many :posts

  validates :name, :email, :password, :gender, :date_of_birth , presence: { message: 'Field Cannot Be Empty' }
  validates :email, format: { with: /[\w.]*\@[\w]*\.[\w]*/ }
  validates :email, uniqueness: true
  validates :password, length: { in: 6..32 }
end
