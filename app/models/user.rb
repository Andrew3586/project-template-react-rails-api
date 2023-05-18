class User < ApplicationRecord
    has_many :dog_houses, dependent: :destroy
end
