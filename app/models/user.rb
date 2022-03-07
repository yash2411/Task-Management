class User < ApplicationRecord
    has_many :projects, dependent: :destroy
    validates :email, uniqueness: true, presence: true
    validates :password, confirmation: true, length: {minimum: 6}, presence: true
    has_secure_password
end
