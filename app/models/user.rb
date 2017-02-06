# Represents a user of the system.
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: { message: "can't be blank" },
            length: { maximum: 50 },
            uniqueness: { case_sensitive: false,
                           message: ': User with this name already exists' }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "can't be blank" },
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false,
                          message: ': User with this email already exists' }
  validates :birthday, presence: { message: "can't be blank" }
  validates :street, presence: { message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :postcode, presence: { message: "can't be blank" }
  belongs_to :reader, optional: true, dependent: :destroy
  belongs_to :librarian, optional: true, dependent: :destroy
  has_secure_password

  def admin?
    librarian && librarian.admin
  end
end
