class UsersListController < ApplicationController
    def index

      list = []
      users = User.all.reverse()

      users.each do |member|
         list << UserSerializer.new(member)
      end
       
        render json: {users: list}
    end
    
    def show
        id = params[:id]
        user = User.find(id)

        render json: {users: UserSerializer.new(user).serializable_hash[:data][:attributes]}
    end
 
    def delete
       id = params[:id]
       
       user = User.find(id)

       if user.destroy
        render json: { message: 'Account deleted successfully!' }
       else
        render json: { message: 'Error while deleting account!' }
       end
    end

    def permissions
      data = params[:permissions]
      id = params[:id]
      user = User.find(id)

      if data && user.update(permissions: data.to_json)
         render json: { message: 'Permissions updated successfully!' }
      else
         render json: { message: 'Error updating permissions!' }
      end
    end

    def search
        query = params[:query]
        list = []
        data = if query == '*'
           User.all
        else
           User.where(
             'lower(first_name) LIKE :search OR lower(last_name) LIKE :search ',
             search: "%#{query.downcase}%"
           )
        end

        data.each do |member|
         list << UserSerializer.new(member)
        end
       
        render json: {users: list}
     end
end