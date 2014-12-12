class User < ActiveRecord::Base


  validates :email, presence: true
  validates :email, uniqueness: true

  def authenticate(password)
    self.password_hash = password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  # def self.assign_hoos
  #   users = User.all.shuffle
  #   users.each do |santa|
  #     santa.hoo_id =
  #   end
  # end
end
