class User < ApplicationRecord

    has_many :posts
    
    require "securerandom"
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :username, presence: true, uniqueness: true
    validates :name, presence: true

end
