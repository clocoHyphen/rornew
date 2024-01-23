class User < ApplicationRecord
    has_secure_password
    validates :email , presence: true
    has_one :music, foreign_key: 'artistId', primary_key: 'userId'
end