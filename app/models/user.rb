# email: string
# password_digest: string
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_many :toys
    
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Must be a valid email address" }, 
                                      length: { maximum: 255 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
end


# before_save { email.downcase! }
# validates :name, presence: true, length: { maximum: 50 }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 255 },
#                   format: { with: VALID_EMAIL_REGEX },
#                   uniqueness: true

# has_secure_password
# validates :password, presence: true, length: { minimum: 6 }