class Book < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true
    validates :price, numericality: { greater_than: 1000 }
    def selectable_users
        User.name
    end
end