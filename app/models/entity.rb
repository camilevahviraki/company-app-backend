class Entity < ApplicationRecord
    has_many :departments, foreign_key: 'entities_id', dependent: :delete_all
end    