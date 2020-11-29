class Wall < ApplicationRecord
  belongs_to :friendship
  belongs_to :sender, class_name: :User

  validates :message, {presence: true}
end
