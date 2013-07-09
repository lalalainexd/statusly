class StatusSerializer < ActiveModel::Serializer
  attributes :text, :created_at
  has_one :user
end
