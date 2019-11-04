class Book < ApplicationRecord
    belongs_to :user, optional: true

    def selectable_users
        User.name
    end
end