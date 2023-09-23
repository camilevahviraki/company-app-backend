class Entity < ApplicationRecord
    has_many :departments, foreign_key: 'entities_id', dependent: :destroy
end    