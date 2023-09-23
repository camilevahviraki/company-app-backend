class EntityController < ApplicationController
   def index
      render json: Entity.all
   end
   
   def show
      entity = Entity.find(params[:id])
      render json: entity
   end
   
   def create
      name = params[:name]
      location = params[:location]
      description = params[:description]

      entity = Entity.new(name:, location:, description:)

      if entity.save
         render json: { message: 'entity created successfully!' }
       else
         render json: { message: 'Error while saving entity!' }
       end
   end

   def delete
      entity = Entity.find(params[:id])
      if entity.destroy
         render json: { message: 'entity deleted successfully!' }
       else
         render json: { message: 'Error while deleting entity!' }
       end
   end
   
   def update
      id = params[:id]
      data = params[:data]
      field = params[:field]
  
      entity = Entity.find(id)

      case field
      when 'name'
         if data.length > 2
            entity.update(name: data)
            render json: { message: 'name updated successfully!' }
         else
            render json: { message: 'The new name is too short!' }
         end   
      when 'description'
         entity.update(name: data)
         render json: { message: 'description updated successfully!' }
      when 'location'
         if data
           entity.update(name: data)
           render json: { message: 'location updated successfully!' }
         else
            render json: { message: 'Please! Provide a new location' }
         end   
      else
         render json: { message: 'Error, Check your params data!' }
      end
   end 
end    