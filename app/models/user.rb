# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password 

  before_save { self.email = email.downcase }
  validates :full_name,  presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true


  has_many :orders, dependent: :destroy
  enum role_enum: { customer: 0, admin: 1 }

end
