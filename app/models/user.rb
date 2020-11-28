class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  has_many :posts, dependent: :destroy
end
