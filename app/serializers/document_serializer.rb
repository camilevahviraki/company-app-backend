class DocumentSerializer < ActiveModel::Serializer
    attributes :id, :name, :data, :department_type, :user_id, :department, :updated_at, :entity

    def department
       Department.find(object.department_id)
    end

    def data
        return unless object.data_url.attached?
        object.data_url.attachment.url
    end

    def entity
       departmente = Department.find(object.department_id)
       Entity.find(departmente.entities_id)
    end
end
