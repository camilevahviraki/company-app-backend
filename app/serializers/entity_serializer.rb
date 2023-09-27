class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :coordinate, :description, :country

  def coordinate
    JSON.parse(object.location) if object.location
  end
end
