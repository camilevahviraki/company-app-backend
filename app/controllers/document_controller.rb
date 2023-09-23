class DocumentController < ApplicationController
    def index
        render json: Document.all
     end
     
     def show
        document = Document.find(params[:id])
        render json: document
     end
     
     def create
        name = params[:name]
        data = params[:data]
        type = params[:type]

        document = Document.new(name:, type:)
  
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
end    