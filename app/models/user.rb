class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :documents, foreign_key: 'user_id', dependent: :destroy
  belongs_to :department, class_name: 'Department', foreign_key: 'department_id', validate: true

  has_one_attached :picture

  def picture_url
    return unless picture.attached?

    picture.attachment.url
  end

  def entity
    departmente = Department.find(department_id)
    Entity.find(departmente.entities_id)
 end

 def department
  Department.find(department_id)
  end

  def permission
    if permissions
      JSON.parse(permissions)
    else
      []
    end    
  end

end
