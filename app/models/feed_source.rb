class FeedSource < ActiveRecord::Base
  belongs_to :feed
  belongs_to :user

  attr_accessible :user
end
