class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: :User

  has_many :walls, dependent: :destroy
end
