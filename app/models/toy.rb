class Toy < ApplicationRecord
  belongs_to :user

  validates :toy_name, presence: true
  validates :description, length: { maximum: 400 }
end
