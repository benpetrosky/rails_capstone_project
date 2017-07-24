class User < ApplicationRecord
  has_many :messages

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  before_save :encrypt_password
  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  has_and_belongs_to_many(:users,
    :join_table => "user_connections",
    :foreign_key => "user_a_id",
    :association_foreign_key => "user_b_id")


  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(username, password)
    user = User.find_by "username = ?", username
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
