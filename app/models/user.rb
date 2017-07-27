class User < ApplicationRecord
  acts_as_messageable
  attr_accessor :password


  def mailboxer_email(object)
    self.email
  end


  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  before_save :encrypt_password
  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  has_and_belongs_to_many(:users,
    :join_table => "user_connections",
    :foreign_key => "user_a_id",
    :association_foreign_key => "user_b_id")


  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(name, password)
    user = User.find_by "name = ?", name
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
