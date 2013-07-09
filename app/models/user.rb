class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password

  has_many :statuses, order: 'created_at DESC'
  has_one :feed
  has_many :feed_sources, through: :feed
  has_many :pending_requests

  def self.create_with_password(username, password, password_confirmation)
    User.create do |user|
      user.username = username
      user.password = password
      user.password_confirmation = password_confirmation
    end
  end

  def add_feed_source(user_to_follow)
    create_feed unless feed
    feed.feed_sources.create(user: user_to_follow)
  end

  def feed_items(after = nil)
    feed_items = []
    feed.feed_sources.each do |source|
      if after
        after = Time.parse(after.to_s)+1
        feed_items << source.user.statuses.where("created_at > ?", after)
      else
        feed_items << source.user.statuses
      end
    end
    feed_items.flatten!
    feed_items.sort_by {|item| item.created_at}.reverse
  end

end
