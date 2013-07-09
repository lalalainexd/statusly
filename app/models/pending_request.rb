class PendingRequest < ActiveRecord::Base

  belongs_to :requestor, class_name: 'User'
  belongs_to :user

  attr_accessible :requestor
end
