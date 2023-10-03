class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :entities_id, :members, :documents, :updated_at, :entity

  def members
    users = User.where(department_id: object.id)
    list = []
    users.each do |member|
      list << UserSerializer.new(member)
    end
    list
  end

  def entity
    Entity.find(object.entities_id)
  end

  def documents
    documents = Document.where(department_id: object.id)
    list = []
    documents.each do |doc|
      list << DocumentDepSerializer.new(doc)
    end
    list
  end
end
