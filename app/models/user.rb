class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Invalid email format"} 
    validates :fname, format: { without: /\d/, message: "should not contain numbers" }
    has_one :music, foreign_key: 'artistId', primary_key: 'userId'
end  