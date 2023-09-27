class DocumentController < ApplicationController
   def index
      id = params[:user_id]
      user = User.find(id)

      if user.admin
         render json: Document.all.reverse(), each_serializer: DocumentSerializer
      else
         render json: Document.where(department_id: user.department_id).reverse(), each_serializer: DocumentSerializer
      end   

   end
     
     def show
        document = Document.find(params[:id])
        render json: document, serializer: DocumentSerializer
     end
     
     def create
        name = params[:name]
        data = params[:data]
        type = params[:type]
        department_id = params[:department_id]
        user_id = params[:user_id]

        document = Document.new(name:, department_type: type, department_id:, user_id:)
  
        if document.save
           document.data_url.attach(data)
           if document.data_url.attached? 
               render json: { message: 'Document created successfully!' }
           else
               document.destroy
               render json: { message: 'Error uploading document!' }
           end 
         else
           render json: { message: 'Error while saving Document!' }
         end
     end
  
     def delete
        document = Document.find(params[:id])
        if document.destroy
           render json: { message: 'Document deleted successfully!' }
         else
           render json: { message: 'Error while deleting Document!' }
         end
     end
     
     def update
        id = params[:id]
        data = params[:data]
        field = params[:field]
    
        document = Document.find(id)
  
        case field
        when 'name'
           if data.length > 2
              document.update(name: data)
              render json: { message: 'name updated successfully!' }
           else
              render json: { message: 'The new name is too short!' }
           end   
        when 'type'
           document.update(type: data)
           render json: { message: 'type updated successfully!' }
        when 'data_url'
           if data
             document.data_url.attach(data)
             render json: { message: 'data updated successfully!' }
           else
              render json: { message: 'Please! Provide a new data' }
           end   
        else
           render json: { message: 'Error, Check your params!' }
        end
     end

     def search
      query = params[:query]
      user_id = params[:user_id]
      user = User.find(user_id)
      data = if query == '*'
         if user.admin
            Document.all
         else
            Document.where(department_id: user.department_id)
         end   
         
      else
         if user.admin
            Document.where(
               'lower(name) LIKE :search',
               search: "%#{query.downcase}%"
             )
         else
            Document.where(
               'lower(name) LIKE :search',
               search: "%#{query.downcase}%"
             ).where(department_id: user.department_id)
         end 
      end
      render json: data, each_serializer: DocumentSerializer
   end
end    