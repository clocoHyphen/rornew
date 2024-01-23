class Music < ApplicationRecord
    belongs_to :user, foreign_key: 'artistId', primary_key: 'userId'
end
