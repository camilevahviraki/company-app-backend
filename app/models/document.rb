class Document < ApplicationRecord
  belongs_to :department, class_name: 'Department', foreign_key: 'department_id', validate: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_one_attached :data_url

  def doc_url
    return unless data_url.attached?

    data_url.attachment.url
  end
end
