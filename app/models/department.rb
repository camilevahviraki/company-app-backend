class Department < ApplicationRecord
    belongs_to :entity, class_name: 'Entity', foreign_key: 'entities_id', validate: true
    has_many :users, foreign_key: 'department_id', dependent: :destroy
    has_many :documents, foreign_key: 'department_id', dependent: :destroy
end
