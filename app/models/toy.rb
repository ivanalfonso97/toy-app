class Toy < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :toy_name, presence: true
  validates :description, length: { maximum: 400 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a jpeg, gif, or png file" },
                    size: { less_than: 5.megabytes, message: "Should be less than 5MB" }
end
