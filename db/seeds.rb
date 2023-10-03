# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# department = Department.create(name: 'Finance', entities_id: entity.id)
unless User.find_by(email: 'admin@gmail.com')
    
  entity = Entity.create(name: 'Magenta Store', country: 'Kenya', location: [-1.303169, 36.826061].to_json)
  department = Department.create(name: 'Finance', entities_id: entity.id)
  permissions = ['delete', 'add', 'edit'].to_json
  User.create(first_name: 'Administrator',
     last_name: 'Oasis',
      permissions:, 
      admin: 'yes',
       email: 'admin@gmail.com', 
       department_id: department.id,
       password: 'admin-password' 
    )
end
