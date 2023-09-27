class UserSerializer
    include FastJsonapi::ObjectSerializer
  
    attributes :id, :first_name, :last_name, :updated_at, :email,
     :picture_url, :department_id, :entity, :department, :permission, :admin

end
  