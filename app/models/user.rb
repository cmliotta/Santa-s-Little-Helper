class User < ActiveRecord::Base

  has_one :hoo, class_name: "User", foreign_key: "hoo_id"

  validates :email, presence: true
  validates :email, uniqueness: true

  def authenticate(password)
    if BCrypt::Password.new(password_hash) == password

      true
    end
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.assign_hoos
    all_users = User.all.shuffle
    all_users.each.with_index do |user, index|
      if index == User.count - 1
        user.hoo = all_users.first
      else
        user.hoo = all_users[index + 1]
      end
      user.save
    end
  end

end
