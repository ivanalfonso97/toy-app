class Toy < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :toy_name, presence: true
  validates :description, length: { maximum: 400 }
  validates :images, content_type: { in: %w[images/jpeg images/gif images/png], message: "must be a jpeg, gif, or png file" },
                    size: { less_than: 5.megabytes, message: "Should be less than 5MB" }
end
