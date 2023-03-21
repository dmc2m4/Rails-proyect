class User < ApplicationRecord

    require "securerandom"
    has_secure_password

    validates :email, presence: true, unique: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :username, presence: true, unique: true
    validates :name, presence: true

end
