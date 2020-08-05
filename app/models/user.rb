class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password_digest, presence: true
    has_secure_password
    has_many :decks
    has_many :flashcards, through: :decks
end
