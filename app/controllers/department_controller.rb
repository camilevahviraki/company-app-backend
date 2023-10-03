class DepartmentController < ApplicationController
  def index
    render json: Department.all
  end

  def show
    department = Department.find(params[:id])
    render json: department, each_serializer: DepartmentSerializer
  end

  def create
    name = params[:name]
    entity_id = params[:entity_id]

    department = Department.new(name:, entities_id: entity_id)

    if department.save
      render json: { message: 'department created successfully!' }
    else
      render json: { message: 'Error while saving department!' }
    end
  end

  def delete
    department = Department.find(params[:id])
    if department.destroy
      render json: { message: 'department deleted successfully!' }
    else
      render json: { message: 'Error while deleting department!' }
    end
  end

  def update
    id = params[:id]
    data = params[:data]
    field = params[:field]

    department = Department.find(id)

    case field
    when 'name'
      if data.length > 2
        department.update(name: data)
        render json: { message: 'name updated successfully!' }
      else
        render json: { message: 'The new name is too short!' }
      end
    else
      render json: { message: 'Error, Check your params!' }
    end
  end
end
