class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  validates_confirmation_of :password

  has_many :statuses, order: 'created_at DESC'

  def self.create_with_password(username, password, password_confirmation)
    User.create do |user|
      user.username = username
      user.password = password
      user.password_confirmation = password_confirmation
    end
  end
end
