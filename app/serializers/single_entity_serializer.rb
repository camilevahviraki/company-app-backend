class SingleEntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :coordinate, :description, :country, :departments

  def coordinate
    JSON.parse(object.location) if object.location
  end

  def departments
    Department.where(entities_id: object.id)
  end
end
