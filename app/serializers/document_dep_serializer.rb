class DocumentDepSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :doc_url, :department_type, :user_id, :department_id, :updated_at
end
